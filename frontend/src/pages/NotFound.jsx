import React from "react";
import { Link } from "react-router-dom";

export default function NotFound() {
  return (
    <div className="min-h-[60vh] grid place-items-center text-center">
      <div>
        <div className="font-display text-9xl neon-magenta">404</div>
        <p className="font-jp text-2xl text-white/60 mt-4">ページが見つかりません</p>
        <Link to="/" className="inline-block mt-6 px-6 py-3 rounded-full bg-[#ff0055] text-white font-display uppercase tracking-widest hover:bg-[#ff0055]/80 transition">
          Voltar ao início
        </Link>
      </div>
    </div>
  );
}
