import React, { useEffect, useState } from "react";
import { Outlet, Link, useNavigate } from "react-router-dom";
import { Search as SearchIcon, Sparkles } from "lucide-react";

export default function Layout() {
  const navigate = useNavigate();
  const [q, setQ] = useState("");
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  const onSubmit = (e) => {
    e.preventDefault();
    if (q.trim()) navigate(`/search?q=${encodeURIComponent(q.trim())}`);
  };

  return (
    <div className="min-h-screen bg-[#050505] text-white">
      <header
        data-testid="site-header"
        className={`fixed top-0 left-0 right-0 z-50 transition-all ${
          scrolled
            ? "bg-black/80 backdrop-blur-xl border-b border-white/10"
            : "bg-transparent"
        }`}
      >
        <div className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 h-16 md:h-20 flex items-center justify-between gap-4">
          <Link to="/" data-testid="brand-link" className="flex items-center gap-3 shrink-0">
            <div className="relative">
              <div className="w-9 h-9 rounded-md bg-gradient-to-br from-[#ff0055] to-[#ff2a2a] grid place-items-center shadow-[0_0_18px_rgba(255,0,85,0.5)]">
                <span className="font-jp font-bold text-white text-lg leading-none">オ</span>
              </div>
            </div>
            <div className="leading-none">
              <div className="font-display text-2xl md:text-3xl tracking-wider text-white">
                OTAKU<span className="neon-magenta">VERSE</span>
              </div>
              <div className="text-[10px] tracking-[0.35em] text-white/40 mt-1 font-jp">
                アニメ・データベース
              </div>
            </div>
          </Link>

          <form onSubmit={onSubmit} className="hidden md:flex flex-1 max-w-xl relative">
            <input
              data-testid="header-search-input"
              value={q}
              onChange={(e) => setQ(e.target.value)}
              placeholder="Pesquisa: anime, diretor, banda sonora, dobrador, estúdio..."
              className="w-full bg-[#0d0d0d] border border-white/10 rounded-full pl-5 pr-12 py-3 text-sm focus:outline-none focus:border-[#00f0ff] focus:ring-1 focus:ring-[#00f0ff] transition placeholder-white/30"
            />
            <button
              data-testid="header-search-submit"
              type="submit"
              className="absolute right-2 top-1/2 -translate-y-1/2 w-9 h-9 grid place-items-center rounded-full bg-[#00f0ff] text-black hover:bg-white transition"
            >
              <SearchIcon size={16} />
            </button>
          </form>

          <nav className="flex items-center gap-1 md:gap-2">
            <Link
              to="/browse"
              data-testid="nav-browse"
              className="hidden md:inline-block px-4 py-2 text-sm text-white/70 hover:text-white transition uppercase tracking-wider font-display"
            >
              Explorar
            </Link>
            <Link
              to="/search?q="
              data-testid="nav-search"
              className="md:hidden p-2 text-white/80"
            >
              <SearchIcon size={20} />
            </Link>
          </nav>
        </div>
      </header>

      <main className="pt-16 md:pt-20">
        <Outlet />
      </main>

      <footer className="border-t border-white/10 mt-24">
        <div className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-10 grid md:grid-cols-3 gap-8">
          <div>
            <div className="font-display text-2xl">
              OTAKU<span className="neon-magenta">VERSE</span>
            </div>
            <p className="text-white/50 text-sm mt-3 max-w-sm">
              A tua base de dados de animes. Pesquisa por título, diretor,
              dobrador, estúdio, banda sonora ou género.
            </p>
          </div>
          <div>
            <div className="font-display tracking-wider text-white/80 uppercase mb-3">Navegar</div>
            <ul className="text-sm text-white/60 space-y-2">
              <li><Link to="/" className="hover:text-[#00f0ff]">Início</Link></li>
              <li><Link to="/browse" className="hover:text-[#00f0ff]">Explorar Animes</Link></li>
              <li><Link to="/search?q=a" className="hover:text-[#00f0ff]">Pesquisar</Link></li>
            </ul>
          </div>
          <div>
            <div className="font-display tracking-wider text-white/80 uppercase mb-3">Otakuverse</div>
            <p className="text-white/50 text-sm flex items-center gap-2">
              <Sparkles size={14} className="text-[#ff0055]" />
              Construído com paixão por anime.
            </p>
            <p className="text-white/30 text-xs mt-4 font-jp">© 2026 オタクバース</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
