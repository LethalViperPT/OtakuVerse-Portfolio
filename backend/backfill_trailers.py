"""Backfill trailer_url for all animes using their stored mal_id.
Uses Jikan's `embed_url` field (the `url` field is often None even when a trailer exists).
"""
import os
import time
import logging
from pathlib import Path
import requests
from pymongo import MongoClient
from dotenv import load_dotenv

ROOT_DIR = Path(__file__).parent
load_dotenv(ROOT_DIR / ".env")

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
log = logging.getLogger("trailers")

client = MongoClient(os.environ["MONGO_URL"])
db = client[os.environ["DB_NAME"]]


def fetch_trailer(mal_id: int) -> str | None:
    try:
        r = requests.get(f"https://api.jikan.moe/v4/anime/{mal_id}", timeout=15)
        if r.status_code == 200:
            t = r.json()["data"].get("trailer") or {}
            embed = t.get("embed_url")
            yt_id = t.get("youtube_id")
            if embed:
                return embed
            if yt_id:
                return f"https://www.youtube-nocookie.com/embed/{yt_id}?enablejsapi=1"
    except Exception as e:
        log.warning("Failed mal_id=%s: %s", mal_id, e)
    return None


def main():
    animes = list(db.animes.find({"mal_id": {"$ne": None}}, {"IdAnime": 1, "Titulo": 1, "mal_id": 1, "trailer_url": 1, "_id": 0}))
    log.info("Found %d animes with mal_id", len(animes))
    for a in animes:
        if a.get("trailer_url"):
            log.info("[%s] already has trailer, skipping", a["Titulo"][:40])
            continue
        embed = fetch_trailer(a["mal_id"])
        db.animes.update_one({"IdAnime": a["IdAnime"]}, {"$set": {"trailer_url": embed}})
        log.info("[%s] trailer=%s", a["Titulo"][:40], "yes" if embed else "NO")
        time.sleep(0.5)
    log.info("Done.")


if __name__ == "__main__":
    main()
