import React, { useEffect, useState } from "react";
import { useLocation, useNavigate, Link } from "react-router-dom";
import { Search as SearchIcon } from "lucide-react";
import { api } from "@/lib/api";
import AnimeCard from "@/components/AnimeCard";

function useQuery() {
  return new URLSearchParams(useLocation().search);
}

const TAB_DEFS = [
  { key: "animes", label: "Animes" },
  { key: "directors", label: "Diretores" },
  { key: "voice_actors", label: "Dobradores" },
  { key: "studios", label: "Estúdios" },
  { key: "soundtracks", label: "Banda Sonora" },
  { key: "genres", label: "Géneros" },
];

export default function Search() {
  const params = useQuery();
  const navigate = useNavigate();
  const initial = params.get("q") || "";
  const [q, setQ] = useState(initial);
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [tab, setTab] = useState("animes");

  useEffect(() => {
    if (!initial.trim()) {
      setData(null);
      return;
    }
    setLoading(true);
    api
      .get("/search", { params: { q: initial } })
      .then((r) => {
        setData(r.data);
        // Auto-select first tab that has results
        const order = ["animes", "directors", "voice_actors", "studios", "soundtracks", "genres"];
        const first = order.find((k) => (r.data.totals?.[k] || 0) > 0);
        if (first) setTab(first);
      })
      .finally(() => setLoading(false));
  }, [initial]);

  const submit = (e) => {
    e.preventDefault();
    if (q.trim()) navigate(`/search?q=${encodeURIComponent(q.trim())}`);
  };

  return (
    <div data-testid="search-page" className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-10 md:py-14">
      <form onSubmit={submit} className="relative mb-8">
        <SearchIcon size={20} className="absolute left-5 top-1/2 -translate-y-1/2 text-white/40" />
        <input
          data-testid="search-input"
          autoFocus
          value={q}
          onChange={(e) => setQ(e.target.value)}
          placeholder="Pesquisa..."
          className="w-full bg-[#0a0a0a] border border-white/10 rounded-full pl-14 pr-32 py-5 text-base md:text-lg text-white focus:outline-none focus:border-[#00f0ff] focus:ring-1 focus:ring-[#00f0ff] transition placeholder-white/30"
        />
        <button
          type="submit"
          data-testid="search-submit"
          className="absolute right-2 top-1/2 -translate-y-1/2 px-5 py-3 rounded-full bg-[#ff0055] text-white font-display uppercase tracking-wider text-sm hover:bg-[#ff0055]/80 transition"
        >
          Pesquisar
        </button>
      </form>

      {!initial && (
        <p data-testid="empty-state" className="text-white/50 text-center py-20 font-jp text-xl">
          Escreve algo para começar a pesquisa.
        </p>
      )}

      {loading && (
        <div className="text-center py-20 font-display tracking-widest text-[#00f0ff]">A PROCURAR...</div>
      )}

      {data && !loading && (
        <>
          <p className="text-white/60 mb-6 text-sm">
            Resultados para{" "}
            <span className="text-white font-display tracking-wider">&ldquo;{data.query}&rdquo;</span>
          </p>

          {/* Tabs */}
          <div className="flex flex-wrap gap-2 mb-8 border-b border-white/10 pb-2">
            {TAB_DEFS.map((t) => (
              <button
                key={t.key}
                data-testid={`tab-${t.key}`}
                onClick={() => setTab(t.key)}
                className={`px-4 py-2 text-xs uppercase tracking-[0.2em] font-display rounded transition ${
                  tab === t.key
                    ? "bg-[#ff0055] text-white shadow-[0_0_18px_rgba(255,0,85,0.4)]"
                    : "text-white/60 hover:text-white border border-white/10"
                }`}
              >
                {t.label}
                <span className="ml-2 opacity-70">{data.totals[t.key]}</span>
              </button>
            ))}
          </div>

          {/* Tab content */}
          {tab === "animes" && (
            <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 md:gap-6">
              {data.animes.map((a, i) => (
                <AnimeCard key={a.IdAnime} anime={a} index={i} />
              ))}
              {data.animes.length === 0 && <NoResults />}
            </div>
          )}

          {tab === "directors" && (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {data.directors.map((d) => (
                <Link
                  key={d.IdDiretor}
                  to={`/director/${d.IdDiretor}`}
                  data-testid={`director-${d.IdDiretor}`}
                  className="p-5 rounded-lg border border-white/10 bg-[#0d0d0d] hover:border-[#00f0ff] hover:bg-[#101010] transition fade-up"
                >
                  <div className="text-xs uppercase tracking-widest text-[#00f0ff] font-display">{d.Tipo}</div>
                  <div className="font-display text-2xl mt-1">{d.Nome}</div>
                  <div className="text-xs text-white/40 mt-1">{d.DataNascimento || "—"}</div>
                </Link>
              ))}
              {data.directors.length === 0 && <NoResults />}
            </div>
          )}

          {tab === "voice_actors" && (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {data.voice_actors.map((d) => (
                <Link
                  key={d.IdAtorVoz}
                  to={`/voice-actor/${d.IdAtorVoz}`}
                  data-testid={`voice-actor-${d.IdAtorVoz}`}
                  className="p-5 rounded-lg border border-white/10 bg-[#0d0d0d] hover:border-[#ff0055] hover:bg-[#101010] transition fade-up"
                >
                  <div className="text-xs uppercase tracking-widest text-[#ff0055] font-display">Dobrador {d.Genero}</div>
                  <div className="font-display text-2xl mt-1">{d.Nome}</div>
                  <div className="text-xs text-white/40 mt-1">{d.DataNascimento || "—"}</div>
                </Link>
              ))}
              {data.voice_actors.length === 0 && <NoResults />}
            </div>
          )}

          {tab === "studios" && (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {data.studios.map((d) => (
                <Link
                  key={d.Nome}
                  to={`/studio/${encodeURIComponent(d.Nome)}`}
                  data-testid={`studio-${d.Nome}`}
                  className="p-5 rounded-lg border border-white/10 bg-[#0d0d0d] hover:border-[#00f0ff] hover:bg-[#101010] transition fade-up"
                >
                  <div className="text-xs uppercase tracking-widest text-[#00f0ff] font-display">Estúdio</div>
                  <div className="font-display text-2xl mt-1">{d.Nome}</div>
                  <div className="text-xs text-white/40 mt-1">Fundado em {d.AnoFundado}</div>
                </Link>
              ))}
              {data.studios.length === 0 && <NoResults />}
            </div>
          )}

          {tab === "soundtracks" && (
            <div className="grid md:grid-cols-2 gap-4">
              {data.soundtracks.map((s) => (
                <Link
                  key={s.IdBandaSonora}
                  to={`/anime/${s.IdAnime}`}
                  data-testid={`soundtrack-${s.IdBandaSonora}`}
                  className="p-5 rounded-lg border border-white/10 bg-[#0d0d0d] hover:border-[#ff0055] transition flex gap-4 fade-up"
                >
                  {s.anime?.image_url && (
                    <img src={s.anime.image_url} alt="" className="w-16 h-24 object-cover rounded" />
                  )}
                  <div className="flex-1 min-w-0">
                    <div className="text-xs uppercase tracking-widest text-[#ff0055] font-display">Banda Sonora</div>
                    <div className="font-display text-xl mt-1">{s.Nome}</div>
                    <div className="text-xs text-white/60 mt-2"><span className="text-[#00f0ff]">OP:</span> {s.Opening}</div>
                    <div className="text-xs text-white/60"><span className="text-[#00f0ff]">ED:</span> {s.Ending}</div>
                    {s.anime && <div className="text-[10px] text-white/40 mt-2 uppercase tracking-widest font-display">{s.anime.Titulo}</div>}
                  </div>
                </Link>
              ))}
              {data.soundtracks.length === 0 && <NoResults />}
            </div>
          )}

          {tab === "genres" && (
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
              {data.genres.map((g) => (
                <Link
                  key={g.IdGenero}
                  to={`/browse?genre=${g.IdGenero}`}
                  data-testid={`genre-${g.IdGenero}`}
                  className="p-5 rounded-lg border border-white/10 bg-[#0d0d0d] hover:border-[#00f0ff] transition fade-up"
                >
                  <div className="text-xs uppercase tracking-widest text-[#00f0ff] font-display">Género</div>
                  <div className="font-display text-2xl mt-1">{g.Nome}</div>
                  <p className="text-xs text-white/50 mt-2 line-clamp-3">{g.Descricao}</p>
                </Link>
              ))}
              {data.genres.length === 0 && <NoResults />}
            </div>
          )}
        </>
      )}
    </div>
  );
}

function NoResults() {
  return (
    <div className="col-span-full text-center py-20 text-white/50 font-jp text-lg">
      Nenhum resultado encontrado nesta categoria.
    </div>
  );
}
