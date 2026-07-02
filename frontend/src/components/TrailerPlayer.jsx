import React, { useState } from "react";
import { Play, X, ExternalLink, Music } from "lucide-react";

/**
 * Click-to-load trailer player ou redirecionamento inteligente para Opening (Fallback).
 * Mantém o design escuro e imersivo com efeitos neon do OtakuVerse.
 */
export default function TrailerPlayer({ embedUrl, thumbnail, title }) {
  const [open, setOpen] = useState(false);
  if (!embedUrl) return null;

  // Detetar se o link gerado pelo backend é o fallback de pesquisa do Opening
  const isSearchFallback = embedUrl.includes("listType=search");

  // Se for fallback, convertemos o URL de embed num link limpo de pesquisa externa do YouTube
  const getExternalYoutubeLink = () => {
    const urlObj = new URL(embedUrl);
    const searchQuery = urlObj.searchParams.get("list");
    return `https://www.youtube.com/results?search_query=${searchQuery}`;
  };

  return (
    <div className="rounded-lg border border-white/10 bg-[#0a0a0a] overflow-hidden">
      {/* Cabeçalho dinâmico baseado no tipo de conteúdo disponível */}
      <div className="px-5 pt-5 pb-3 flex items-center gap-2 text-[#ff0055] text-xs uppercase tracking-[0.25em] font-display">
        {isSearchFallback ? (
          <>
            <Music size={14} /> Banda Sonora (Opening)
          </>
        ) : (
          <>
            <Play size={14} /> Trailer Oficial
          </>
        )}
      </div>

      <div className="relative aspect-video bg-black">
        {/* CASO 1: É o Fallback de música de abertura (Design de Botão Premium Interativo) */}
        {isSearchFallback ? (
          <div className="absolute inset-0 flex flex-col items-center justify-center p-6 text-center group">
            {thumbnail && (
              <img
                src={thumbnail}
                alt={title}
                className="absolute inset-0 w-full h-full object-cover opacity-20 filter blur-sm transition duration-500 group-hover:scale-105"
              />
            )}
            <div className="absolute inset-0 bg-gradient-to-t from-[#0a0a0a] via-black/60 to-transparent" />
            
            <div className="relative z-10 flex flex-col items-center gap-4 max-w-sm">
              <p className="text-zinc-400 text-xs px-4 leading-relaxed">
                Este anime clássico não possui um trailer oficial disponível em formato embutido.
              </p>
              
              {/* Botão de Redirecionamento estilizado */}
              <a
                href={getExternalYoutubeLink()}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-3 px-6 py-3 bg-[#ff0055] hover:bg-[#d60047] text-white text-xs uppercase font-display tracking-[0.2em] font-bold rounded-md shadow-[0_0_30px_rgba(255,0,85,0.4)] hover:shadow-[0_0_40px_rgba(255,0,85,0.6)] hover:scale-102 active:scale-98 transition duration-300 transform"
              >
                Ouvir Opening no YouTube
                <ExternalLink size={14} className="animate-pulse" />
              </a>
            </div>
          </div>
        ) : (
          /* CASO 2: É um Trailer funcional padrão (Mantém o teu player original) */
          !open ? (
            <button
              onClick={() => setOpen(true)}
              data-testid="trailer-play-btn"
              className="absolute inset-0 group grid place-items-center"
            >
              {thumbnail && (
                <img
                  src={thumbnail}
                  alt={title}
                  className="absolute inset-0 w-full h-full object-cover opacity-50 group-hover:opacity-70 transition"
                />
              )}
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent" />
              <div className="relative z-10 flex flex-col items-center gap-3">
                <div className="w-20 h-20 rounded-full bg-[#ff0055] grid place-items-center shadow-[0_0_40px_rgba(255,0,85,0.6)] group-hover:scale-110 transition-transform">
                  <Play size={32} className="text-white ml-1" fill="currentColor" />
                </div>
                <span className="font-display tracking-[0.3em] uppercase text-sm text-white">
                  Ver Trailer
                </span>
              </div>
            </button>
          ) : (
            <>
              <iframe
                data-testid="trailer-iframe"
                src={embedUrl + (embedUrl.includes("?") ? "&autoplay=1" : "?autoplay=1")}
                title={`${title} trailer`}
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
                className="absolute inset-0 w-full h-full"
              />
              <button
                onClick={() => setOpen(false)}
                data-testid="trailer-close-btn"
                className="absolute top-2 right-2 z-10 w-9 h-9 rounded-full bg-black/80 hover:bg-[#ff0055] grid place-items-center text-white transition"
                aria-label="Fechar trailer"
              >
                <X size={16} />
              </button>
            </>
          )
        )}
      </div>
    </div>
  );
}
