"""
Seed MongoDB from the user-provided MariaDB SQL dump (anime catalog).
- Parses INSERT INTO statements with a small SQL-value tokenizer (handles escaped quotes).
- Fetches a poster image URL from Jikan v4 (MyAnimeList public API) for each anime by title (since the SQL has no images).
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

client = MongoClient(os.environ["MONGO_URL"])
db = client[os.environ["DB_NAME"]]


# ---------- SQL parsing ----------

def parse_values(values_str: str):
    """Parse a single SQL tuple body: e.g. "4, 'Hello \\'world\\'', NULL, 2009".
    Returns list of Python values (str/int/None/float)."""
    out = []
    i = 0
    n = len(values_str)
    while i < n:
        # skip whitespace and commas
        while i < n and values_str[i] in " ,\t\n":
            i += 1
        if i >= n:
            break
        c = values_str[i]
        if c == "'":
            # string literal
            i += 1
            start = i
            buf = []
            while i < n:
                if values_str[i] == "\\" and i + 1 < n:
                    # escape sequence
                    nxt = values_str[i + 1]
                    if nxt == "'":
                        buf.append("'")
                    elif nxt == "\\":
                        buf.append("\\")
                    elif nxt == "n":
                        buf.append("\n")
                    elif nxt == "t":
                        buf.append("\t")
                    elif nxt == '"':
                        buf.append('"')
                    else:
                        buf.append(nxt)
                    i += 2
                elif values_str[i] == "'":
                    # check for doubled quote (escape)
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
            # number, NULL, or bare token
            start = i
            while i < n and values_str[i] not in ",":
                i += 1
            token = values_str[start:i].strip()
            if token.upper() == "NULL":
                out.append(None)
            else:
                try:
                    if "." in token:
                        out.append(float(token))
                    else:
                        out.append(int(token))
                except ValueError:
                    out.append(token)
    return out


def split_tuples(big: str):
    """Split a string of multiple SQL tuples like '(...),(...),(...);' respecting quotes."""
    tuples = []
    i = 0
    n = len(big)
    while i < n:
        # find opening paren
        while i < n and big[i] != "(":
            i += 1
        if i >= n:
            break
        i += 1  # past '('
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
                    # doubled '' inside string
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


def parse_insert(sql: str, table: str, columns: list):
    """Find INSERT INTO `table` ... VALUES (...),(...); statements and return list of dicts."""
    pattern = re.compile(
        rf"INSERT\s+INTO\s+`{re.escape(table)}`\s*\([^)]*\)\s*VALUES\s*(.*?);",
        re.IGNORECASE | re.DOTALL,
    )
    rows = []
    for m in pattern.finditer(sql):
        body = m.group(1)
        for tup in split_tuples(body):
            values = parse_values(tup)
            if len(values) != len(columns):
                log.warning("Column mismatch in %s: %s vs %s", table, len(values), len(columns))
                continue
            rows.append(dict(zip(columns, values)))
    return rows


# ---------- Image fetching from Jikan ----------

def fetch_poster(title: str) -> dict:
    """Search Jikan for the anime by title and return image URL.
    Returns {'image_url': ..., 'trailer_url': ..., 'mal_id': ...} or empty dict on failure."""
    # Light cleaning: only keep first 80 chars of title for the query to avoid 404s on hugely long names
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
                trailer = a.get("trailer", {}).get("url")
                return {
                    "image_url": img,
                    "trailer_url": trailer,
                    "mal_id": a.get("mal_id"),
                    "mal_url": a.get("url"),
                }
    except Exception as e:
        log.warning("Jikan failed for '%s': %s", title, e)
    return {}


# ---------- Main seed ----------

def main():
    if not SQL_PATH.exists():
        log.error("SQL file not found: %s", SQL_PATH)
        sys.exit(1)

    sql = SQL_PATH.read_text(encoding="utf-8")

    # Parse all tables
    animes = parse_insert(sql, "animes", [
        "IdAnime", "Titulo", "Descricao", "AnoEmissao", "anoFim",
        "Temporada", "Season", "Classificacao", "ClassificacaoEtaria",
        "BaseadoEm", "NumeroEpisodio", "Estado",
    ])
    animediretor = parse_insert(sql, "animediretor", ["idAnime", "idDiretor"])
    animeestudios = parse_insert(sql, "animeestudios", ["estudio", "IdAnime"])
    animegeneros = parse_insert(sql, "animegeneros", ["IdAnime", "IdGenero"])
    animevozes = parse_insert(sql, "animevozes", ["IdAnime", "IdAtorVoz"])
    atorvoz = parse_insert(sql, "atorvoz", ["IdAtorVoz", "Nome", "DataNascimento", "Genero"])
    bandasonora = parse_insert(sql, "bandasonora", [
        "IdBandaSonora", "Nome", "IdAnime", "Opening", "Ending",
    ])
    diretor = parse_insert(sql, "diretor", [
        "IdDiretor", "Nome", "DataNascimento", "Genero", "Tipo",
    ])
    estudioanimacao = parse_insert(sql, "estudioanimacao", [
        "Nome", "AnoFundado", "Fundador", "SiteOficial",
    ])
    generos = parse_insert(sql, "generos", ["IdGenero", "Nome", "Descricao"])

    log.info(
        "Parsed: animes=%d diretor=%d ator=%d bandasonora=%d generos=%d estudios=%d "
        "links(animediretor=%d animeestudios=%d animegeneros=%d animevozes=%d)",
        len(animes), len(diretor), len(atorvoz), len(bandasonora), len(generos),
        len(estudioanimacao), len(animediretor), len(animeestudios),
        len(animegeneros), len(animevozes),
    )

    # Fetch posters from Jikan (skip if already seeded)
    existing_posters = {
        a["IdAnime"]: a for a in db.animes.find(
            {}, {"IdAnime": 1, "image_url": 1, "trailer_url": 1, "mal_id": 1, "mal_url": 1, "_id": 0}
        )
    }

    for a in animes:
        cached = existing_posters.get(a["IdAnime"])
        if cached and cached.get("image_url"):
            a["image_url"] = cached.get("image_url")
            a["trailer_url"] = cached.get("trailer_url")
            a["mal_id"] = cached.get("mal_id")
            a["mal_url"] = cached.get("mal_url")
            continue
        info = fetch_poster(a["Titulo"])
        a.update(info)
        log.info("[%s] poster=%s", a["Titulo"][:50], "yes" if a.get("image_url") else "NO")
        time.sleep(0.6)  # Jikan rate limit: 3 req/s

    # Drop and re-insert
    for col in [
        "animes", "animediretor", "animeestudios", "animegeneros", "animevozes",
        "atorvoz", "bandasonora", "diretor", "estudioanimacao", "generos",
    ]:
        db[col].drop()

    if animes:
        db.animes.insert_many(animes)
        db.animes.create_index("IdAnime", unique=True)
        db.animes.create_index([("Titulo", "text"), ("Descricao", "text")])
    if animediretor:
        db.animediretor.insert_many(animediretor)
    if animeestudios:
        db.animeestudios.insert_many(animeestudios)
    if animegeneros:
        db.animegeneros.insert_many(animegeneros)
    if animevozes:
        db.animevozes.insert_many(animevozes)
    if atorvoz:
        db.atorvoz.insert_many(atorvoz)
        db.atorvoz.create_index("IdAtorVoz", unique=True)
    if bandasonora:
        db.bandasonora.insert_many(bandasonora)
    if diretor:
        db.diretor.insert_many(diretor)
        db.diretor.create_index("IdDiretor", unique=True)
    if estudioanimacao:
        db.estudioanimacao.insert_many(estudioanimacao)
    if generos:
        db.generos.insert_many(generos)
        db.generos.create_index("IdGenero", unique=True)

    log.info("Seed complete.")


if __name__ == "__main__":
    main()