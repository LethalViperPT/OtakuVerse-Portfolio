import React, { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import { api } from "@/lib/api";
import AnimeCard from "@/components/AnimeCard";

export default function StudioDetail() {
  const { name } = useParams();
  const [d, setD] = useState(null);
  useEffect(() => { api.get(`/studios/${encodeURIComponent(name)}`).then((r) => setD(r.data)).catch(() => setD({ notFound: true })); }, [name]);
  if (!d) return <div className="text-center py-20 font-display tracking-widest text-[#00f0ff]">A CARREGAR...</div>;
  if (d.notFound) return <p className="text-center py-20 font-display text-3xl">Estúdio não encontrado</p>;

  return (
    <div data-testid="studio-detail-page" className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-10 md:py-14">
      <Link to="/" className="text-white/60 hover:text-[#00f0ff] text-sm">← Voltar</Link>
      <div className="mt-6">
        <div className="text-xs uppercase tracking-[0.3em] text-[#00f0ff] font-display">Estúdio de Animação</div>
        <h1 className="font-display text-5xl md:text-7xl uppercase tracking-tighter mt-2">{d.Nome}</h1>
        <p className="text-white/50 text-sm mt-2">Fundado em {d.AnoFundado} · {d.Fundador}</p>
        {d.SiteOficial && (
          <a href={d.SiteOficial.startsWith("http") ? d.SiteOficial : `https://${d.SiteOficial}`} target="_blank" rel="noreferrer" className="text-[#00f0ff] text-sm mt-2 inline-block hover:underline">
            {d.SiteOficial} ↗
          </a>
        )}
      </div>

      <h2 className="font-display text-3xl uppercase tracking-tight mt-12 mb-6">Animações</h2>
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 md:gap-6">
        {(d.animes || []).map((a, i) => <AnimeCard key={a.IdAnime} anime={a} index={i} />)}
      </div>
    </div>
  );
}
