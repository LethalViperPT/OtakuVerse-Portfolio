"""
Seed MongoDB from the user-provided MariaDB SQL dump (anime catalog).
- ENCODING RESILIENT EDITION: Handles special characters and accents seamlessly.
- Idempotent: drops collections then re-inserts.
"""
import os
import re
import sys
import time
import logging
from pathlib import Path
import requests
from pymongo import MongoClient
from dotenv import load_dotenv

ROOT_DIR = Path(__file__).parent
load_dotenv(ROOT_DIR / ".env")

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
log = logging.getLogger("seed")

SQL_PATH = ROOT_DIR / "data" / "anime.sql"

# Ordem de colunas conhecida de cada tabela — usada como fallback quando o
# dump SQL não inclui a lista de colunas explícita (ex: mysqldump sem
# --complete-insert, que gera "INSERT INTO `tabela` VALUES (...)").
KNOWN_SCHEMAS = {
    "animes": ["IdAnime", "Titulo", "Descricao", "AnoEmissao", "anoFim", "Temporada",
               "Season", "Classificacao", "ClassificacaoEtaria", "BaseadoEm",
               "NumeroEpisodio", "Estado"],
    "animediretor": ["idAnime", "idDiretor"],
    "animeestudios": ["estudio", "IdAnime"],
    "animegeneros": ["IdAnime", "IdGenero"],
    "animevozes": ["IdAnime", "IdAtorVoz"],
    "atorvoz": ["IdAtorVoz", "Nome", "DataNascimento", "Genero"],
    "bandasonora": ["IdBandaSonora", "Nome", "IdAnime", "Opening", "Ending"],
    "diretor": ["IdDiretor", "Nome", "DataNascimento", "Genero", "Tipo"],
    "estudioanimacao": ["Nome", "AnoFundado", "Fundador", "SiteOficial"],
    "generos": ["IdGenero", "Nome", "Descricao"],
}

client = MongoClient(os.environ["MONGO_URL"])
db = client[os.environ["DB_NAME"]]


# ---------- SQL parsing ----------

def parse_values(values_str: str):
    out = []
    i = 0
    n = len(values_str)
    while i < n:
        while i < n and values_str[i] in " ,\t\n":
            i += 1
        if i >= n:
            break
        c = values_str[i]
        if c == "'":
            i += 1
            buf = []
            while i < n:
                if values_str[i] == "\\" and i + 1 < n:
                    nxt = values_str[i + 1]
                    if nxt == "'": buf.append("'")
                    elif nxt == "\\": buf.append("\\")
                    elif nxt == "n": buf.append("\n")
                    elif nxt == "t": buf.append("\t")
                    elif nxt == '"': buf.append('"')
                    else: buf.append(nxt)
                    i += 2
                elif values_str[i] == "'":
                    if i + 1 < n and values_str[i + 1] == "'":
                        buf.append("'")
                        i += 2
                    else:
                        i += 1
                        break
                else:
                    buf.append(values_str[i])
                    i += 1
            out.append("".join(buf))
        else:
            start = i
            while i < n and values_str[i] not in ",":
                i += 1
            token = values_str[start:i].strip()
            if token.upper() == "NULL":
                out.append(None)
            else:
                try:
                    if "." in token: out.append(float(token))
                    else: out.append(int(token))
                except ValueError:
                    out.append(token)
    return out


def split_tuples(big: str):
    tuples = []
    i = 0
    n = len(big)
    while i < n:
        while i < n and big[i] != "(":
            i += 1
        if i >= n:
            break
        i += 1
        depth = 1
        start = i
        in_string = False
        while i < n and depth > 0:
            c = big[i]
            if in_string:
                if c == "\\" and i + 1 < n:
                    i += 2
                    continue
                if c == "'":
                    if i + 1 < n and big[i + 1] == "'":
                        i += 2
                        continue
                    in_string = False
                    i += 1
                    continue
                i += 1
                continue
            else:
                if c == "'":
                    in_string = True
                    i += 1
                    continue
                if c == "(":
                    depth += 1
                    i += 1
                    continue
                if c == ")":
                    depth -= 1
                    if depth == 0:
                        tuples.append(big[start:i])
                        i += 1
                        break
                    i += 1
                    continue
                i += 1
    return tuples


def find_statement_end(sql: str, start: int) -> int:
    """From `start` (right after VALUES), scan char-by-char to find the ';' that
    truly terminates the SQL statement — i.e. one that is outside any quoted
    string and outside any parentheses. A naive regex like '(.*?);' breaks on
    titles containing a literal semicolon (e.g. 'Steins;Gate'), silently
    truncating everything after that row."""
    i = start
    n = len(sql)
    depth = 0
    in_string = False
    while i < n:
        c = sql[i]
        if in_string:
            if c == "\\" and i + 1 < n:
                i += 2
                continue
            if c == "'":
                if i + 1 < n and sql[i + 1] == "'":
                    i += 2
                    continue
                in_string = False
                i += 1
                continue
            i += 1
            continue
        else:
            if c == "'":
                in_string = True
                i += 1
                continue
            if c == "(":
                depth += 1
                i += 1
                continue
            if c == ")":
                depth -= 1
                i += 1
                continue
            if c == ";" and depth == 0:
                return i
            i += 1
    return n


def parse_insert_dynamic(sql: str, table: str):
    """Finds ALL INSERT INTO statements, cleaning up formatting and accents.
    Handles both formats:
      INSERT INTO `table` (`col1`,`col2`) VALUES (...);          <- explicit columns
      INSERT INTO `table` VALUES (...);                          <- mysqldump default (no columns)
    When columns are missing, falls back to the known schema order.
    Statement boundaries are found with a quote-aware scanner (find_statement_end)
    instead of a naive regex, so semicolons inside string values (e.g. the title
    'Steins;Gate') don't truncate the data.
    """
    header_pattern = re.compile(
        rf"INSERT\s+INTO\s+[`\"']?{re.escape(table)}[`\"']?\s*(?:\(([^)]+)\)\s*)?VALUES\s*",
        re.IGNORECASE,
    )
    fallback_columns = KNOWN_SCHEMAS.get(table)
    rows = []
    for m in header_pattern.finditer(sql):
        cols_str = m.group(1)
        if cols_str:
            columns = [c.strip(" `\"'") for c in cols_str.split(",")]
        elif fallback_columns:
            columns = fallback_columns
        else:
            log.warning("Sem lista de colunas e sem fallback conhecido para tabela '%s' — a saltar.", table)
            continue
        body_start = m.end()
        body_end = find_statement_end(sql, body_start)
        body = sql[body_start:body_end]
        for tup in split_tuples(body):
            values = parse_values(tup)
            if len(values) != len(columns):
                log.warning(
                    "Mismatch em '%s': %d valores vs %d colunas esperadas — a saltar linha.",
                    table, len(values), len(columns),
                )
                continue
            rows.append(dict(zip(columns, values)))
    return rows


# ---------- Image fetching from Jikan ----------

def fetch_poster(title: str) -> dict:
    """Search Jikan for the anime by title and return image URL and formatted trailer embed."""
    q = title[:80]
    url = "https://api.jikan.moe/v4/anime"
    try:
        resp = requests.get(url, params={"q": q, "limit": 1, "sfw": "false"}, timeout=15)
        if resp.status_code == 200:
            data = resp.json()
            arr = data.get("data") or []
            if arr:
                a = arr[0]
                img = (
                    a.get("images", {}).get("webp", {}).get("large_image_url")
                    or a.get("images", {}).get("jpg", {}).get("large_image_url")
                    or a.get("images", {}).get("jpg", {}).get("image_url")
                )
                
                # Parsing seguro do objeto do trailer
                trailer_obj = a.get("trailer") or {}
                youtube_id = trailer_obj.get("youtube_id")
                
                # Normalização direta para Iframe (Evita bloqueios de CORS e autoplay bugs)
                if youtube_id:
                    trailer = f"https://www.youtube.com/embed/{youtube_id}"
                else:
                    trailer = trailer_obj.get("embed_url") or trailer_obj.get("url")

                return {
                    "image_url": img,
                    "trailer_url": trailer,
                    "mal_id": a.get("mal_id"),
                    "mal_url": a.get("url"),
                }
        elif resp.status_code == 429:
            log.warning("Rate limit atingido na API. A pausar temporariamente...")
            time.sleep(3)
    except Exception as e:
        log.warning("Falha na API Jikan para '%s': %s", title, e)
    return {}


# ---------- Main seed ----------

def main():
    if not SQL_PATH.exists():
        log.error("SQL file not found: %s", SQL_PATH)
        sys.exit(1)

    # Abrir com utf-8 e IGNORE para contornar truncagens ou caracteres marados de dumps antigos
    with open(SQL_PATH, "r", encoding="utf-8", errors="ignore") as f:
        sql = f.read()

    # Parsing estrito de todas as tabelas mapeadas
    animes = parse_insert_dynamic(sql, "animes")
    animediretor = parse_insert_dynamic(sql, "animediretor")
    animeestudios = parse_insert_dynamic(sql, "animeestudios")
    animegeneros = parse_insert_dynamic(sql, "animegeneros")
    animevozes = parse_insert_dynamic(sql, "animevozes")
    atorvoz = parse_insert_dynamic(sql, "atorvoz")
    bandasonora = parse_insert_dynamic(sql, "bandasonora")
    diretor = parse_insert_dynamic(sql, "diretor")
    estudioanimacao = parse_insert_dynamic(sql, "estudioanimacao")
    generos = parse_insert_dynamic(sql, "generos")

    log.info("Lidos do SQL dinamicamente: %d animes prontos para injetar.", len(animes))

    # Reutiliza o cache existente no Mongo para evitar estourar o limite de requests do Jikan
    existing_posters = {}
    try:
        existing_posters = {
            a["IdAnime"]: a for a in db.animes.find(
                {}, {"IdAnime": 1, "image_url": 1, "trailer_url": 1, "mal_id": 1, "mal_url": 1, "_id": 0}
            )
        }
    except Exception:
        pass

    # Atualiza ou pesquisa dados de media na API externa
    for a in animes:
        cached = existing_posters.get(a.get("IdAnime") or a.get("idanime"))
        if cached and cached.get("image_url") and "Sem+Imagem" not in cached.get("image_url"):
            a["image_url"] = cached.get("image_url")
            a["trailer_url"] = cached.get("trailer_url")
            a["mal_id"] = cached.get("mal_id")
            a["mal_url"] = cached.get("mal_url")
            continue
        
        title_key = next((k for k in a.keys() if k.lower() == "titulo"), "Titulo")
        info = fetch_poster(a[title_key])
        
        if not info.get("image_url"):
            info["image_url"] = "https://placehold.co/600x400?text=Sem+Imagem"
            info["trailer_url"] = None
            
        a.update(info)
        log.info("[%s] poster=%s trailer=%s", a[title_key][:40], "yes" if info.get("image_url") else "NO", "yes" if info.get("trailer_url") else "NO")
        time.sleep(1.0)

    log.info("A limpar coleções antigas no MongoDB...")
    for col in [
        "animes", "animediretor", "animeestudios", "animegeneros", "animevozes",
        "atorvoz", "bandasonora", "diretor", "estudioanimacao", "generos",
    ]:
        db[col].drop()

    log.info("A injetar todos os dados nas coleções...")
    if animes:
        db.animes.insert_many(animes)
        id_field = next((k for k in animes[0].keys() if k.lower() == "idanime"), "IdAnime")
        title_field = next((k for k in animes[0].keys() if k.lower() == "titulo"), "Titulo")
        desc_field = next((k for k in animes[0].keys() if k.lower() == "descricao"), "Descricao")
        
        db.animes.create_index(id_field, unique=True)
        db.animes.create_index([(title_field, "text"), (desc_field, "text")])

    if animediretor: db.animediretor.insert_many(animediretor)
    if animeestudios: db.animeestudios.insert_many(animeestudios)
    if animegeneros: db.animegeneros.insert_many(animegeneros)
    if animevozes: db.animevozes.insert_many(animevozes)
    
    if atorvoz:
        db.atorvoz.insert_many(atorvoz)
        id_ator = next((k for k in atorvoz[0].keys() if k.lower() == "idatorvoz"), "IdAtorVoz")
        db.atorvoz.create_index(id_ator, unique=True)
        
    if bandasonora: db.bandasonora.insert_many(bandasonora)
    
    if diretor:
        db.diretor.insert_many(diretor)
        id_dir = next((k for k in diretor[0].keys() if k.lower() == "iddiretor"), "IdDiretor")
        db.diretor.create_index(id_dir, unique=True)
        
    if estudioanimacao: db.estudioanimacao.insert_many(estudioanimacao)
    
    if generos:
        db.generos.insert_many(generos)
        id_gen = next((k for k in generos[0].keys() if k.lower() == "idgenero"), "IdGenero")
        db.generos.create_index(id_gen, unique=True)

    log.info("Sucesso! Todos os dados e média foram sincronizados.")


if __name__ == "__main__":
    main()