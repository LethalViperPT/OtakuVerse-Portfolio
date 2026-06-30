import React, { useEffect, useMemo, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { api } from "@/lib/api";
import AnimeCard from "@/components/AnimeCard";
import { Filter, X } from "lucide-react";
import { Slider } from "@/components/ui/slider";

function useQuery() {
  return new URLSearchParams(useLocation().search);
}

const YEAR_FLOOR = 1990;
const YEAR_CEIL = 2026;

export default function Browse() {
  const params = useQuery();
  const navigate = useNavigate();
  const [genres, setGenres] = useState([]);
  const [animes, setAnimes] = useState([]);
  const [loading, setLoading] = useState(true);

  // Initial filters from URL
  const initialGenres = useMemo(() => {
    const all = params.getAll("genre");
    return all.length ? all.map(Number).filter(Boolean) : [];
  }, []); // eslint-disable-line

  const [selectedGenres, setSelectedGenres] = useState(initialGenres);
  const [yearRange, setYearRange] = useState([
    Number(params.get("year_min")) || YEAR_FLOOR,
    Number(params.get("year_max")) || YEAR_CEIL,
  ]);
  const [season, setSeason] = useState(params.get("season") || "");
  const [status, setStatus] = useState(params.get("status") || "");
  const [sort, setSort] = useState(params.get("sort") || "rating");

  useEffect(() => {
    api.get("/genres").then((r) => setGenres(r.data));
  }, []);

  useEffect(() => {
    setLoading(true);
    const usp = new URLSearchParams();
    selectedGenres.forEach((g) => usp.append("genre", g));
    if (season) usp.set("season", season);
    if (status) usp.set("status", status);
    if (sort) usp.set("sort", sort);
    if (yearRange[0] > YEAR_FLOOR) usp.set("year_min", yearRange[0]);
    if (yearRange[1] < YEAR_CEIL) usp.set("year_max", yearRange[1]);
    usp.set("limit", "200");

    api
      .get(`/animes?${usp.toString()}`)
      .then((r) => setAnimes(r.data))
      .finally(() => setLoading(false));

    // Sync URL (without limit)
    const urlUsp = new URLSearchParams(usp);
    urlUsp.delete("limit");
    navigate(`/browse?${urlUsp.toString()}`, { replace: true });
  }, [selectedGenres, yearRange, season, status, sort, navigate]);

  const toggleGenre = (id) => {
    setSelectedGenres((prev) =>
      prev.includes(id) ? prev.filter((g) => g !== id) : [...prev, id]
    );
  };

  const hasFilters =
    selectedGenres.length > 0 ||
    season ||
    status ||
    yearRange[0] !== YEAR_FLOOR ||
    yearRange[1] !== YEAR_CEIL;

  const clearAll = () => {
    setSelectedGenres([]);
    setSeason("");
    setStatus("");
    setSort("rating");
    setYearRange([YEAR_FLOOR, YEAR_CEIL]);
  };

  return (
    <div data-testid="browse-page" className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-10 md:py-14">
      <div className="mb-8">
        <div className="text-xs uppercase tracking-[0.3em] text-[#00f0ff] font-display">Explorar</div>
        <h1 className="font-display text-5xl md:text-6xl uppercase tracking-tight mt-2">
          Catálogo <span className="neon-magenta">Otaku</span>
        </h1>
      </div>

      {/* Filter panel */}
      <div className="mb-8 p-5 rounded-lg bg-[#0a0a0a] border border-white/10 space-y-6">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2 text-[#00f0ff] text-xs uppercase tracking-[0.25em] font-display">
            <Filter size={14} /> Filtros
          </div>
          {hasFilters && (
            <button
              data-testid="clear-filters"
              onClick={clearAll}
              className="text-xs text-[#ff0055] uppercase tracking-widest font-display hover:text-white transition flex items-center gap-1"
            >
              <X size={12} /> Limpar tudo
            </button>
          )}
        </div>

        {/* Multi-genre chips */}
        <div>
          <div className="text-[10px] uppercase tracking-[0.25em] text-white/40 mb-3 font-display">
            Géneros {selectedGenres.length > 0 && (
              <span className="text-[#ff0055] ml-2">{selectedGenres.length} selecionado{selectedGenres.length > 1 ? "s" : ""}</span>
            )}
          </div>
          <div className="flex flex-wrap gap-2">
            {genres.map((g) => {
              const active = selectedGenres.includes(g.IdGenero);
              return (
                <button
                  key={g.IdGenero}
                  data-testid={`genre-chip-${g.IdGenero}`}
                  onClick={() => toggleGenre(g.IdGenero)}
                  className={`px-3 py-1.5 text-xs uppercase tracking-wider rounded-full border transition font-display ${
                    active
                      ? "bg-[#ff0055] text-white border-[#ff0055] shadow-[0_0_15px_rgba(255,0,85,0.45)]"
                      : "bg-white/5 text-white/70 border-white/10 hover:border-[#00f0ff] hover:text-white"
                  }`}
                >
                  {g.Nome}
                </button>
              );
            })}
          </div>
        </div>

        {/* Year range slider */}
        <div>
          <div className="text-[10px] uppercase tracking-[0.25em] text-white/40 mb-3 font-display flex items-center justify-between">
            <span>Intervalo de Anos</span>
            <span className="text-[#00f0ff] tracking-wider font-display text-sm" data-testid="year-range-display">
              {yearRange[0]} — {yearRange[1]}
            </span>
          </div>
          <div className="px-1 pt-2 pb-1">
            <Slider
              data-testid="year-range-slider"
              min={YEAR_FLOOR}
              max={YEAR_CEIL}
              step={1}
              value={yearRange}
              onValueChange={setYearRange}
              className="[&_[role=slider]]:bg-[#ff0055] [&_[role=slider]]:border-[#ff0055] [&_.bg-primary]:bg-[#ff0055] [&_.bg-primary\\/20]:bg-white/10"
            />
          </div>
        </div>

        {/* Other selects */}
        <div className="flex flex-wrap gap-3 pt-2 border-t border-white/5">
          <select
            data-testid="filter-season"
            value={season}
            onChange={(e) => setSeason(e.target.value)}
            className="bg-[#111] border border-white/10 rounded-md px-3 py-2 text-sm focus:outline-none focus:border-[#00f0ff]"
          >
            <option value="">Todas as estações</option>
            <option value="Winter">Winter</option>
            <option value="Spring">Spring</option>
            <option value="Summer">Summer</option>
            <option value="Fall">Fall</option>
          </select>
          <select
            data-testid="filter-status"
            value={status}
            onChange={(e) => setStatus(e.target.value)}
            className="bg-[#111] border border-white/10 rounded-md px-3 py-2 text-sm focus:outline-none focus:border-[#00f0ff]"
          >
            <option value="">Qualquer estado</option>
            <option value="Em exibição">Em exibição</option>
            <option value="Terminado">Terminado</option>
            <option value="Cancelado">Cancelado</option>
          </select>
          <select
            data-testid="filter-sort"
            value={sort}
            onChange={(e) => setSort(e.target.value)}
            className="bg-[#111] border border-white/10 rounded-md px-3 py-2 text-sm focus:outline-none focus:border-[#00f0ff]"
          >
            <option value="rating">Ordenar: Classificação</option>
            <option value="year">Ordenar: Ano</option>
            <option value="title">Ordenar: Título</option>
          </select>
        </div>
      </div>

      {loading ? (
        <div className="text-center py-20 font-display tracking-widest text-[#00f0ff]">A CARREGAR...</div>
      ) : (
        <>
          <p className="text-white/50 text-sm mb-6" data-testid="results-count">{animes.length} animes</p>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 md:gap-6">
            {animes.map((a, i) => (
              <AnimeCard key={a.IdAnime} anime={a} index={i} />
            ))}
          </div>
          {animes.length === 0 && (
            <div className="text-center py-20 text-white/50 font-jp text-lg">
              Nenhum anime corresponde aos filtros.
            </div>
          )}
        </>
      )}
    </div>
  );
}
