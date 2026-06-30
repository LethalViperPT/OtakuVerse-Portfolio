import React, { useState } from "react";
import { Play, X } from "lucide-react";

/**
 * Click-to-load trailer player. Shows a thumbnail with a play button;
 * loads the iframe only when clicked (avoids autoplay + saves bandwidth).
 */
export default function TrailerPlayer({ embedUrl, thumbnail, title }) {
  const [open, setOpen] = useState(false);
  if (!embedUrl) return null;

  return (
    <div className="rounded-lg border border-white/10 bg-[#0a0a0a] overflow-hidden">
      <div className="px-5 pt-5 pb-3 flex items-center gap-2 text-[#ff0055] text-xs uppercase tracking-[0.25em] font-display">
        <Play size={14} /> Trailer
      </div>
      <div className="relative aspect-video bg-black">
        {!open ? (
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
        )}
      </div>
    </div>
  );
}
