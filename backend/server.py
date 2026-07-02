import os
import logging
from pathlib import Path
from typing import List, Optional
from fastapi import FastAPI, APIRouter, HTTPException, Query
from dotenv import load_dotenv
from starlette.middleware.cors import CORSMiddleware
from motor.motor_asyncio import AsyncIOMotorClient

ROOT_DIR = Path(__file__).parent
load_dotenv(ROOT_DIR / '.env')

# Obter variáveis de ambiente de forma segura
mongo_url = os.getenv('MONGO_URL')
db_name = os.getenv('DB_NAME', 'otaku_db')

if not mongo_url:
    raise ValueError("A variável de ambiente MONGO_URL não foi encontrada!")

client = AsyncIOMotorClient(mongo_url, tlsAllowInvalidCertificates=True)
db = client[db_name]

# Inicializar a App
app = FastAPI(title="Otakuverse API")

# ---------- Configuração do CORS ----------
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Inicializar o Router com o prefixo /api
api_router = APIRouter(prefix="/api")

# ---------- Helpers ----------

def clean(doc):
    if doc is None:
        return None
    if "_id" in doc:
        doc.pop("_id", None)
    return doc


async def enrich_anime(anime: dict, full: bool = False) -> dict:
    """Attach genres, directors, studios, voice_actors, soundtracks to an anime dict."""
    anime = clean(anime)
    aid = anime["IdAnime"]

    # Genres
    gens_links = await db.animegeneros.find({"IdAnime": aid}, {"_id": 0}).to_list(100)
    gen_ids = [g["IdGenero"] for g in gens_links]
    genres = await db.generos.find({"IdGenero": {"$in": gen_ids}}, {"_id": 0}).to_list(100)
    anime["genres"] = genres

    # Studios
    studios_links = await db.animeestudios.find({"IdAnime": aid}, {"_id": 0}).to_list(100)
    anime["studios"] = [s["estudio"] for s in studios_links]

    if full:
        # Directors
        dirs_links = await db.animediretor.find({"idAnime": aid}, {"_id": 0}).to_list(100)
        dir_ids = [d["idDiretor"] for d in dirs_links]
        directors = await db.diretor.find({"IdDiretor": {"$in": dir_ids}}, {"_id": 0}).to_list(100)
        anime["directors"] = directors

        # Voice actors
        voz_links = await db.animevozes.find({"IdAnime": aid}, {"_id": 0}).to_list(200)
        voz_ids = [v["IdAtorVoz"] for v in voz_links]
        voice_actors = await db.atorvoz.find({"IdAtorVoz": {"$in": voz_ids}}, {"_id": 0}).to_list(200)
        anime["voice_actors"] = voice_actors

        # Soundtracks
        sound = await db.bandasonora.find({"IdAnime": aid}, {"_id": 0}).to_list(50)
        anime["soundtracks"] = sound

        # ---------- MÁGICA DO TRAILER FALLBACK ----------
        # Se não houver trailer_url guardado ou se estiver vazio, tentamos usar o Opening
        if not anime.get("trailer_url"):
            if sound and len(sound) > 0:
                # Vamos buscar o primeiro opening disponível na tabela de bandas sonoras
                primeiro_opening = sound[0].get("Opening")
                if primeiro_opening:
                    # Removemos texto desnecessário do início se houver (ex: "1: ", "2: ")
                    termo_pesquisa = primeiro_opening.split(":")[-1].strip()
                    # Geramos um link de pesquisa embutido do YouTube focado no Opening oficial
                    query_formatada = f"{anime['Titulo']} {termo_pesquisa} Opening".replace(" ", "+")
                    anime["trailer_url"] = f"https://www.youtube-nocookie.com/embed?listType=search&list={query_formatada}"
        # ------------------------------------------------

        # Studio details (with founders / sites)
        studio_details = await db.estudioanimacao.find(
            {"Nome": {"$in": anime["studios"]}}, {"_id": 0}
        ).to_list(100)
        anime["studio_details"] = studio_details
    return anime


# ---------- Routes ----------

@api_router.get("/")
async def root():
    return {"message": "Otakuverse API"}


@api_router.get("/stats")
async def stats():
    counts = {
        "animes": await db.animes.count_documents({}),
        "directors": await db.diretor.count_documents({}),
        "voice_actors": await db.atorvoz.count_documents({}),
        "studios": await db.estudioanimacao.count_documents({}),
        "soundtracks": await db.bandasonora.count_documents({}),
        "genres": await db.generos.count_documents({}),
    }
    return counts


@api_router.get("/animes")
async def list_animes(
    q: Optional[str] = None,
    genre: Optional[List[int]] = Query(None),
    year: Optional[int] = None,
    year_min: Optional[int] = None,
    year_max: Optional[int] = None,
    season: Optional[str] = None,
    status: Optional[str] = None,
    min_rating: Optional[int] = None,
    sort: Optional[str] = "rating",
    limit: int = 100,
):
    query = {}
    if q:
        query["Titulo"] = {"$regex": q, "$options": "i"}
    if year:
        query["AnoEmissao"] = year
    if year_min is not None or year_max is not None:
        year_q = {}
        if year_min is not None:
            year_q["$gte"] = year_min
        if year_max is not None:
            year_q["$lte"] = year_max
        query["AnoEmissao"] = year_q
    if season:
        query["Season"] = season
    if status:
        query["Estado"] = status
    if min_rating:
        query["Classificacao"] = {"$gte": min_rating}

    if genre:
        anime_ids_sets = []
        for g in genre:
            links = await db.animegeneros.find({"IdGenero": g}, {"_id": 0}).to_list(500)
            anime_ids_sets.append({l["IdAnime"] for l in links})
        if anime_ids_sets:
            intersect = set.intersection(*anime_ids_sets)
            query["IdAnime"] = {"$in": list(intersect)}

    sort_field = {"rating": ("Classificacao", -1), "year": ("AnoEmissao", -1), "title": ("Titulo", 1)}.get(
        sort, ("Classificacao", -1)
    )
    cursor = db.animes.find(query, {"_id": 0}).sort(sort_field[0], sort_field[1]).limit(limit)
    animes = await cursor.to_list(limit)
    enriched = [await enrich_anime(a, full=False) for a in animes]
    return enriched


@api_router.get("/animes/{anime_id}")
async def get_anime(anime_id: int):
    anime = await db.animes.find_one({"IdAnime": anime_id}, {"_id": 0})
    if not anime:
        raise HTTPException(404, "Anime not found")
    return await enrich_anime(anime, full=True)


@api_router.get("/genres")
async def list_genres():
    return await db.generos.find({}, {"_id": 0}).sort("Nome", 1).to_list(100)


@api_router.get("/directors")
async def list_directors(q: Optional[str] = None, tipo: Optional[str] = None):
    query = {}
    if q:
        query["Nome"] = {"$regex": q, "$options": "i"}
    if tipo:
        query["Tipo"] = tipo
    return await db.diretor.find(query, {"_id": 0}).sort("Nome", 1).to_list(500)


@api_router.get("/directors/{director_id}")
async def get_director(director_id: int):
    director = await db.diretor.find_one({"IdDiretor": director_id}, {"_id": 0})
    if not director:
        raise HTTPException(404, "Director not found")
    links = await db.animediretor.find({"idDiretor": director_id}, {"_id": 0}).to_list(100)
    anime_ids = [link["idAnime"] for link in links]
    animes = await db.animes.find({"IdAnime": {"$in": anime_ids}}, {"_id": 0}).to_list(100)
    director["animes"] = [await enrich_anime(a, full=False) for a in animes]
    return director


@api_router.get("/voice-actors")
async def list_voice_actors(q: Optional[str] = None):
    query = {}
    if q:
        query["Nome"] = {"$regex": q, "$options": "i"}
    return await db.atorvoz.find(query, {"_id": 0}).sort("Nome", 1).to_list(500)


@api_router.get("/voice-actors/{actor_id}")
async def get_voice_actor(actor_id: int):
    actor = await db.atorvoz.find_one({"IdAtorVoz": actor_id}, {"_id": 0})
    if not actor:
        raise HTTPException(404, "Voice actor not found")
    links = await db.animevozes.find({"IdAtorVoz": actor_id}, {"_id": 0}).to_list(100)
    anime_ids = [link["IdAnime"] for link in links]
    animes = await db.animes.find({"IdAnime": {"$in": anime_ids}}, {"_id": 0}).to_list(100)
    actor["animes"] = [await enrich_anime(a, full=False) for a in animes]
    return actor


@api_router.get("/studios")
async def list_studios(q: Optional[str] = None):
    query = {}
    if q:
        query["Nome"] = {"$regex": q, "$options": "i"}
    return await db.estudioanimacao.find(query, {"_id": 0}).sort("Nome", 1).to_list(500)


@api_router.get("/studios/{studio_name}")
async def get_studio(studio_name: str):
    studio = await db.estudioanimacao.find_one({"Nome": studio_name}, {"_id": 0})
    if not studio:
        raise HTTPException(404, "Studio not found")
    links = await db.animeestudios.find({"estudio": studio_name}, {"_id": 0}).to_list(100)
    anime_ids = [link["IdAnime"] for link in links]
    animes = await db.animes.find({"IdAnime": {"$in": anime_ids}}, {"_id": 0}).to_list(100)
    studio["animes"] = [await enrich_anime(a, full=False) for a in animes]
    return studio


@api_router.get("/soundtracks")
async def list_soundtracks(q: Optional[str] = None):
    query = {}
    if q:
        query["$or"] = [
            {"Nome": {"$regex": q, "$options": "i"}},
            {"Opening": {"$regex": q, "$options": "i"}},
            {"Ending": {"$regex": q, "$options": "i"}},
        ]
    items = await db.bandasonora.find(query, {"_id": 0}).to_list(500)
    for it in items:
        a = await db.animes.find_one({"IdAnime": it["IdAnime"]}, {"_id": 0})
        if a:
            it["anime"] = await enrich_anime(a, full=False)
    return items


@api_router.get("/search")
async def global_search(q: str = Query(..., min_length=1)):
    """Global search that returns matches across all entities."""
    rx = {"$regex": q, "$options": "i"}

    animes = await db.animes.find(
        {"$or": [{"Titulo": rx}, {"Descricao": rx}]}, {"_id": 0}
    ).limit(50).to_list(50)
    animes = [await enrich_anime(a, full=False) for a in animes]

    directors = await db.diretor.find({"Nome": rx}, {"_id": 0}).limit(20).to_list(20)
    voice_actors = await db.atorvoz.find({"Nome": rx}, {"_id": 0}).limit(20).to_list(20)
    studios = await db.estudioanimacao.find({"Nome": rx}, {"_id": 0}).limit(20).to_list(20)
    soundtracks = await db.bandasonora.find(
        {"$or": [{"Nome": rx}, {"Opening": rx}, {"Ending": rx}]}, {"_id": 0}
    ).limit(20).to_list(20)
    for s in soundtracks:
        a = await db.animes.find_one({"IdAnime": s["IdAnime"]}, {"_id": 0})
        if a:
            s["anime"] = await enrich_anime(a, full=False)

    genres = await db.generos.find(
        {"$or": [{"Nome": rx}, {"Descricao": rx}]}, {"_id": 0}
    ).limit(20).to_list(20)

    return {
        "query": q,
        "animes": animes,
        "directors": directors,
        "voice_actors": voice_actors,
        "studios": studios,
        "soundtracks": soundtracks,
        "genres": genres,
        "totals": {
            "animes": len(animes),
            "directors": len(directors),
            "voice_actors": len(voice_actors),
            "studios": len(studios),
            "soundtracks": len(soundtracks),
            "genres": len(genres),
        },
    }

app.include_router(api_router)

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


@app.on_event("shutdown")
async def shutdown_db_client():
    client.close()

if __name__ == '__main__':
    import uvicorn
    port = int(os.getenv("PORT", 8000))
    uvicorn.run("server:app", host="0.0.0.0", port=port)