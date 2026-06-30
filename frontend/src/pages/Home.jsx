import React, { useEffect, useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { Search as SearchIcon, TrendingUp, Sparkles, Flame } from "lucide-react";
import { api } from "@/lib/api";
import AnimeCard from "@/components/AnimeCard";

export default function Home() {
  const [q, setQ] = useState("");
  const [featured, setFeatured] = useState([]);
  const [trending, setTrending] = useState([]);
  const [stats, setStats] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    api.get("/animes", { params: { sort: "rating", limit: 10 } }).then((r) => setFeatured(r.data));
    api.get("/animes", { params: { sort: "year", limit: 10 } }).then((r) => setTrending(r.data));
    api.get("/stats").then((r) => setStats(r.data));
  }, []);

  const onSubmit = (e) => {
    e.preventDefault();
    if (q.trim()) navigate(`/search?q=${encodeURIComponent(q.trim())}`);
  };

  const hero = featured[0];

  return (
    <div data-testid="home-page">
      {/* HERO */}
      <section className="relative hero-glow overflow-hidden">
        {hero?.image_url && (
          <div className="absolute inset-0 opacity-30 mix-blend-luminosity">
            <img src={hero.image_url} alt="" className="w-full h-full object-cover blur-2xl scale-110" />
            <div className="absolute inset-0 bg-gradient-to-b from-[#050505]/60 via-[#050505]/80 to-[#050505]" />
          </div>
        )}

        <div className="relative max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 pt-16 md:pt-24 pb-20 md:pb-32 kanji-bg">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full border border-[#00f0ff]/30 bg-[#00f0ff]/5 text-[#00f0ff] text-xs uppercase tracking-[0.3em] font-display mb-6">
              <Sparkles size={12} /> アニメ Database
            </div>
            <h1 className="font-display text-6xl sm:text-7xl md:text-8xl lg:text-9xl leading-[0.85] uppercase tracking-tighter">
              <span className="block text-white">OTAKU</span>
              <span className="block neon-magenta">VERSE</span>
            </h1>
            <p className="font-jp text-2xl text-white/60 mt-4">
              アニメの世界を探検しよう
            </p>
            <p className="text-white/70 text-base md:text-lg mt-6 max-w-xl leading-relaxed">
              Pesquisa o universo anime — títulos, diretores, dobradores, estúdios e
              bandas sonoras. Mergulha numa base de dados curada de obras lendárias.
            </p>

            {/* Search */}
            <form onSubmit={onSubmit} className="mt-10 max-w-2xl">
              <div className="search-shine rounded-full p-[2px]">
                <div className="relative bg-[#0a0a0a] rounded-full flex items-center">
                  <SearchIcon size={20} className="absolute left-5 text-white/40" />
                  <input
                    data-testid="hero-search-input"
                    autoFocus
                    value={q}
                    onChange={(e) => setQ(e.target.value)}
                    placeholder="Pesquisa por anime, diretor, dobrador, estúdio, OP/ED..."
                    className="w-full bg-transparent pl-14 pr-32 py-5 text-base md:text-lg text-white focus:outline-none placeholder-white/30 rounded-full"
                  />
                  <button
                    type="submit"
                    data-testid="hero-search-submit"
                    className="absolute right-2 top-1/2 -translate-y-1/2 px-5 py-3 rounded-full bg-[#ff0055] text-white font-display uppercase tracking-wider text-sm hover:bg-[#ff0055]/80 transition shadow-[0_0_20px_rgba(255,0,85,0.45)]"
                  >
                    Pesquisar
                  </button>
                </div>
              </div>
              <div className="flex flex-wrap gap-2 mt-4 text-xs">
                <span className="text-white/40 mr-2 self-center uppercase tracking-widest font-display">Sugestões:</span>
                {["MAPPA", "Naruto", "Sawano", "Yoko Kanno", "Code Geass"].map((s) => (
                  <button
                    key={s}
                    type="button"
                    data-testid={`suggestion-${s.toLowerCase().replace(/\s+/g, "-")}`}
                    onClick={() => navigate(`/search?q=${encodeURIComponent(s)}`)}
                    className="px-3 py-1 rounded-full border border-white/10 bg-white/5 text-white/70 hover:border-[#00f0ff] hover:text-[#00f0ff] transition"
                  >
                    {s}
                  </button>
                ))}
              </div>
            </form>

            {/* Stats */}
            {stats && (
              <div className="grid grid-cols-3 md:grid-cols-6 gap-4 md:gap-6 mt-14 max-w-3xl">
                {[
                  { k: "animes", l: "Animes" },
                  { k: "directors", l: "Diretores" },
                  { k: "voice_actors", l: "Dobradores" },
                  { k: "studios", l: "Estúdios" },
                  { k: "soundtracks", l: "OST" },
                  { k: "genres", l: "Géneros" },
                ].map((s) => (
                  <div key={s.k} className="border-l-2 border-[#ff0055]/60 pl-3" data-testid={`stat-${s.k}`}>
                    <div className="font-display text-3xl md:text-4xl text-white">{stats[s.k]}</div>
                    <div className="text-[10px] uppercase tracking-[0.25em] text-white/40 mt-1">{s.l}</div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </section>

      {/* Top Rated */}
      <section className="seigaiha border-y border-white/5">
        <div className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-16">
          <div className="flex items-end justify-between mb-8">
            <div>
              <div className="inline-flex items-center gap-2 text-[#ff0055] text-xs uppercase tracking-[0.3em] font-display">
                <Flame size={14} /> Top Classificados
              </div>
              <h2 className="font-display text-4xl md:text-5xl uppercase tracking-tight mt-2">
                Lendas <span className="neon-magenta">do Anime</span>
              </h2>
            </div>
            <Link
              to="/browse"
              data-testid="link-browse-all"
              className="hidden md:inline text-sm uppercase tracking-widest font-display text-[#00f0ff] hover:text-white transition"
            >
              Ver tudo →
            </Link>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 md:gap-6">
            {featured.slice(0, 10).map((a, i) => (
              <AnimeCard key={a.IdAnime} anime={a} index={i} />
            ))}
          </div>
        </div>
      </section>

      {/* Newest */}
      <section>
        <div className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-16">
          <div className="flex items-end justify-between mb-8">
            <div>
              <div className="inline-flex items-center gap-2 text-[#00f0ff] text-xs uppercase tracking-[0.3em] font-display">
                <TrendingUp size={14} /> Recentes
              </div>
              <h2 className="font-display text-4xl md:text-5xl uppercase tracking-tight mt-2">
                Novidades <span className="neon-cyan">na Plataforma</span>
              </h2>
            </div>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 md:gap-6">
            {trending.slice(0, 10).map((a, i) => (
              <AnimeCard key={a.IdAnime} anime={a} index={i} />
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
