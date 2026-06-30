import React from "react";
import "@/App.css";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { Toaster } from "sonner";

import Layout from "@/components/Layout";
import Home from "@/pages/Home";
import Browse from "@/pages/Browse";
import Search from "@/pages/Search";
import AnimeDetail from "@/pages/AnimeDetail";
import DirectorDetail from "@/pages/DirectorDetail";
import VoiceActorDetail from "@/pages/VoiceActorDetail";
import StudioDetail from "@/pages/StudioDetail";
import NotFound from "@/pages/NotFound";

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route element={<Layout />}>
            <Route path="/" element={<Home />} />
            <Route path="/browse" element={<Browse />} />
            <Route path="/search" element={<Search />} />
            <Route path="/anime/:id" element={<AnimeDetail />} />
            <Route path="/director/:id" element={<DirectorDetail />} />
            <Route path="/voice-actor/:id" element={<VoiceActorDetail />} />
            <Route path="/studio/:name" element={<StudioDetail />} />
            <Route path="*" element={<NotFound />} />
          </Route>
        </Routes>
      </BrowserRouter>
      <Toaster theme="dark" position="bottom-right" />
    </div>
  );
}

export default App;
