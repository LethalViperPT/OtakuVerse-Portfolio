import React from "react";
import { Link } from "react-router-dom";
import { Star, Calendar } from "lucide-react";

export default function AnimeCard({ anime, index = 0 }) {
  if (!anime) return null;
  const id = anime.IdAnime;
  const img = anime.image_url || "https://via.placeholder.com/300x450/111/333?text=Sem+Imagem";
  const rating = Number(anime.Classificacao || 0);

  return (
    <Link
      to={`/anime/${id}`}
      data-testid={`anime-card-${id}`}
      className="group relative rounded-lg overflow-hidden bg-[#0d0d0d] border border-white/5 card-glow transition-all duration-300 fade-up"
      style={{ animationDelay: `${Math.min(index, 12) * 40}ms` }}
    >
      <div className="aspect-[2/3] w-full overflow-hidden relative bg-[#111]">
        <img
          src={img}
          alt={anime.Titulo}
          loading="lazy"
          onError={(e) => {
            e.currentTarget.src =
              "https://via.placeholder.com/300x450/111/333?text=Sem+Imagem";
          }}
          className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent opacity-90" />
        {rating > 0 && (
          <div className="absolute top-2 right-2 flex items-center gap-1 px-2 py-1 rounded bg-black/70 backdrop-blur border border-[#00f0ff]/30 text-[#00f0ff] text-xs font-display tracking-wider">
            <Star size={12} fill="currentColor" />
            {rating}
          </div>
        )}
        {anime.Estado === "Em exibição" && (
          <div className="absolute top-2 left-2 px-2 py-1 rounded bg-[#ff0055] text-white text-[10px] font-display tracking-widest uppercase">
            ● Live
          </div>
        )}
      </div>

      <div className="p-3">
        <h3
          className="font-display text-base md:text-lg tracking-wide leading-tight uppercase text-white line-clamp-2 group-hover:text-[#00f0ff] transition"
          title={anime.Titulo}
        >
          {anime.Titulo}
        </h3>
        <div className="flex items-center gap-3 text-xs text-white/50 mt-1.5">
          <span className="flex items-center gap-1">
            <Calendar size={11} /> {anime.AnoEmissao}
          </span>
          <span className="uppercase tracking-wider">{anime.Season}</span>
        </div>
        {anime.genres && anime.genres.length > 0 && (
          <div className="flex flex-wrap gap-1 mt-2">
            {anime.genres.slice(0, 2).map((g) => (
              <span
                key={g.IdGenero}
                className="text-[10px] uppercase tracking-wider px-2 py-0.5 rounded-full border border-white/10 bg-white/5 text-white/70"
              >
                {g.Nome}
              </span>
            ))}
          </div>
        )}
      </div>
    </Link>
  );
}
