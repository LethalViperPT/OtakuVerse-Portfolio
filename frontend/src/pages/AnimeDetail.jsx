import React, { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import { api } from "@/lib/api";
import { Star, Calendar, Tv, Bookmark, ArrowLeft, Music, Mic, Clapperboard, Building2 } from "lucide-react";
import TrailerPlayer from "@/components/TrailerPlayer";

export default function AnimeDetail() {
  const { id } = useParams();
  const [anime, setAnime] = useState(null);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    setAnime(null);
    setNotFound(false);
    api
      .get(`/animes/${id}`)
      .then((r) => setAnime(r.data))
      .catch(() => setNotFound(true));
  }, [id]);

  if (notFound) {
    return (
      <div className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-20 text-center">
        <p className="font-display text-3xl">Anime não encontrado</p>
        <Link to="/" className="text-[#00f0ff] mt-4 inline-block">← Voltar ao início</Link>
      </div>
    );
  }

  if (!anime) {
    return <div className="text-center py-20 font-display tracking-widest text-[#00f0ff]">A CARREGAR...</div>;
  }

  return (
    <div data-testid="anime-detail-page">
      {/* Hero */}
      <section className="relative">
        {anime.image_url && (
          <div className="absolute inset-0 -z-10 overflow-hidden">
            <img src={anime.image_url} alt="" className="w-full h-full object-cover opacity-30 blur-2xl scale-125" />
            <div className="absolute inset-0 bg-gradient-to-b from-[#050505]/40 via-[#050505]/80 to-[#050505]" />
          </div>
        )}
        <div className="max-w-[1400px] mx-auto px-4 md:px-8 lg:px-12 py-10 md:py-16">
          <Link to="/" className="inline-flex items-center gap-2 text-white/60 hover:text-[#00f0ff] text-sm mb-6 transition" data-testid="back-home">
            <ArrowLeft size={16} /> Voltar
          </Link>

          <div className="grid md:grid-cols-12 gap-8">
            {/* Poster */}
            <div className="md:col-span-4 lg:col-span-3">
              <div className="aspect-[2/3] rounded-lg overflow-hidden border border-white/10 shadow-[0_0_40px_rgba(255,0,85,0.25)] sticky top-24">
                <img
                  src={anime.image_url || "https://via.placeholder.com/400x600/111/333?text=Sem+Imagem"}
                  alt={anime.Titulo}
                  className="w-full h-full object-cover"
                />
              </div>
            </div>

            {/* Info */}
            <div className="md:col-span-8 lg:col-span-9 kanji-bg">
              <div className="flex flex-wrap gap-2 mb-4">
                {anime.Estado === "Em exibição" && (
                  <span className="px-3 py-1 text-xs uppercase tracking-widest font-display bg-[#ff0055] text-white rounded">● Em exibição</span>
                )}
                <span className="px-3 py-1 text-xs uppercase tracking-widest font-display border border-[#00f0ff]/40 text-[#00f0ff] bg-[#00f0ff]/5 rounded">
                  {anime.ClassificacaoEtaria}
                </span>
                <span className="px-3 py-1 text-xs uppercase tracking-widest font-display border border-white/10 text-white/70 rounded">
                  {anime.BaseadoEm}
                </span>
              </div>
              <h1 data-testid="anime-title" className="font-display text-4xl md:text-6xl lg:text-7xl uppercase tracking-tighter leading-[0.9]">
                {anime.Titulo}
              </h1>
              <div className="flex flex-wrap items-center gap-5 mt-4 text-sm">
                <div className="flex items-center gap-2 text-[#00f0ff]">
                  <Star size={16} fill="currentColor" /> <span className="font-display text-2xl">{anime.Classificacao}</span> <span className="text-white/40">/10</span>
                </div>
                <div className="flex items-center gap-2 text-white/70">
                  <Calendar size={14} /> {anime.AnoEmissao}{anime.anoFim ? ` – ${anime.anoFim}` : ""} · {anime.Season}
                </div>
                <div className="flex items-center gap-2 text-white/70">
                  <Tv size={14} /> {anime.NumeroEpisodio} eps
                </div>
                <div className="flex items-center gap-2 text-white/70">
                  <Bookmark size={14} /> Temporada {anime.Temporada}
                </div>
              </div>

              {/* Genres */}
              {anime.genres?.length > 0 && (
                <div className="flex flex-wrap gap-2 mt-6">
                  {anime.genres.map((g) => (
                    <Link
                      key={g.IdGenero}
                      to={`/browse?genre=${g.IdGenero}`}
                      data-testid={`detail-genre-${g.IdGenero}`}
                      className="px-3 py-1 text-xs uppercase tracking-wider rounded-full border border-white/10 bg-white/5 text-white/80 hover:border-[#ff0055] hover:text-white transition"
                    >
                      {g.Nome}
                    </Link>
                  ))}
                </div>
              )}

              <p data-testid="anime-description" className="text-white/75 leading-relaxed mt-8 text-base md:text-lg max-w-3xl">
                {anime.Descricao}
              </p>

              {anime.trailer_url && (
                <div className="mt-8" data-testid="anime-trailer">
                  <TrailerPlayer
                    embedUrl={anime.trailer_url}
                    thumbnail={anime.image_url}
                    title={anime.Titulo}
                  />
                </div>
              )}

              {/* Bento Grid */}
              <div className="grid md:grid-cols-2 gap-4 mt-10">
                {/* Directors */}
                <InfoBlock icon={<Clapperboard size={16} />} label="Diretores" accent="cyan">
                  {anime.directors?.length ? (
                    <ul className="space-y-2">
                      {anime.directors.map((d) => (
                        <li key={d.IdDiretor}>
                          <Link
                            to={`/director/${d.IdDiretor}`}
                            className="hover:text-[#00f0ff] transition flex justify-between"
                          >
                            <span className="font-display tracking-wide">{d.Nome}</span>
                            <span className="text-xs text-white/40">{d.Tipo}</span>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  ) : <Empty />}
                </InfoBlock>

                {/* Studios */}
                <InfoBlock icon={<Building2 size={16} />} label="Estúdios" accent="magenta">
                  {anime.studio_details?.length ? (
                    <ul className="space-y-2">
                      {anime.studio_details.map((s) => (
                        <li key={s.Nome}>
                          <Link to={`/studio/${encodeURIComponent(s.Nome)}`} className="hover:text-[#ff0055] transition flex justify-between">
                            <span className="font-display tracking-wide">{s.Nome}</span>
                            <span className="text-xs text-white/40">Fundado em {s.AnoFundado}</span>
                          </Link>
                        </li>
                      ))}
                    </ul>
                  ) : anime.studios?.length ? (
                    <ul className="space-y-2">
                      {anime.studios.map((s) => <li key={s} className="font-display tracking-wide">{s}</li>)}
                    </ul>
                  ) : <Empty />}
                </InfoBlock>

                {/* Voice Actors */}
                <InfoBlock icon={<Mic size={16} />} label="Dobradores" accent="magenta" wide>
                  {anime.voice_actors?.length ? (
                    <div className="grid grid-cols-2 gap-2">
                      {anime.voice_actors.map((v) => (
                        <Link
                          key={v.IdAtorVoz}
                          to={`/voice-actor/${v.IdAtorVoz}`}
                          className="text-sm hover:text-[#ff0055] transition border-l border-white/10 pl-2"
                        >
                          <div className="font-display tracking-wide">{v.Nome}</div>
                          <div className="text-[10px] uppercase tracking-widest text-white/40">{v.Genero} · {v.DataNascimento || "—"}</div>
                        </Link>
                      ))}
                    </div>
                  ) : <Empty />}
                </InfoBlock>

                {/* Soundtracks */}
                <InfoBlock icon={<Music size={16} />} label="Banda Sonora" accent="cyan" wide>
                  {anime.soundtracks?.length ? (
                    <div className="space-y-3">
                      {anime.soundtracks.map((s) => (
                        <div key={s.IdBandaSonora} className="text-sm">
                          <div className="font-display tracking-wide text-white">{s.Nome}</div>
                          <div className="text-xs text-white/60 mt-1"><span className="text-[#00f0ff]">Opening:</span> {s.Opening}</div>
                          <div className="text-xs text-white/60"><span className="text-[#00f0ff]">Ending:</span> {s.Ending}</div>
                        </div>
                      ))}
                    </div>
                  ) : <Empty />}
                </InfoBlock>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}

function InfoBlock({ icon, label, accent, children, wide }) {
  const color = accent === "magenta" ? "text-[#ff0055]" : "text-[#00f0ff]";
  return (
    <div className={`rounded-lg border border-white/10 bg-[#0a0a0a]/70 backdrop-blur p-5 ${wide ? "md:col-span-2" : ""}`}>
      <div className={`flex items-center gap-2 ${color} text-xs uppercase tracking-[0.25em] font-display mb-3`}>
        {icon} {label}
      </div>
      <div className="text-white/80">{children}</div>
    </div>
  );
}

function Empty() {
  return <p className="text-white/30 text-sm italic">Sem informação disponível.</p>;
}
