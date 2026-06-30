# Otakuverse — PRD

## Original problem statement
"Eu quero que me cries um site bastante apelativo de pesquisas de listas de animes. Quero que apareça a imagem de cada anime quando a gente pesquisa. Cria um nome altamente para o site"

## User choices
- Data source: only the SQL dump the user provided (anime catalog with ~37 animes, directors, voice actors, studios, soundtracks, genres). NOTE: poster images come from Jikan API (public, no key) since the SQL has none.
- Functionality: full search across all entities (animes, directors, soundtracks, voice actors, studios, genres)
- Brand name: Otakuverse
- Aesthetic: dark mode + neon/traditional Japanese

## Architecture
- Backend: FastAPI + Motor (Mongo), `/api/*` routes only.
- DB: MongoDB. Collections mirror SQL tables (animes, animediretor, animeestudios, animegeneros, animevozes, atorvoz, bandasonora, diretor, estudioanimacao, generos).
- Seed: `backend/seed.py` parses `backend/data/anime.sql` and fetches one poster per anime from Jikan v4 (one-time).
- Frontend: React + Tailwind + Radix/shadcn primitives. Fonts: Bebas Neue, Shippori Mincho, Outfit.

## Implemented
- 2026-02: MVP — global search + dedicated pages for anime, director, voice actor, studio. Browse with filters (genre/season/status/sort). 37 animes seeded with posters.

## Backlog
- P1: Featured "Filme" page, advanced filtering (multi-genre, year range slider)
- P2: User favourites (watchlist) — requires auth
- P2: Admin CRUD UI to add new animes/relations
- P2: Trailer embed on detail page (already storing trailer_url)
