import React, { useEffect, useState } from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Header from "./componentes/Header";
import Footer from "./componentes/Footer";
import Landing from "./componentes/Landing";
import Tienda from "./componentes/Tienda";
import Camiseta from "./componentes/Camiseta";
import Custom404 from "./componentes/Custom404";
import Perfil from "./componentes/Perfil";

const App = () => {
  return (
    <Router>
        <Header />
        <Routes>
          <Route path="/" element={<Landing />} />
          <Route path="/tienda" element={<Tienda />} />
          <Route path="/camiseta/:id" element={<Camiseta />} />
          <Route path="/perfil/*" element={<Perfil />} />
          <Route path="*" element={<Custom404 />} />
        </Routes>
        <Footer />
    </Router>
  );
};

export default App;