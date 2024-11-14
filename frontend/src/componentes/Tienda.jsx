import React from "react";
import '../css/Tienda.css'
import Destacadas from "./Destacadas";
import Buscador from "./Buscador";
import TopVentas from "./TopVentas";

const destacadas=[
  "/img/fondos/destacadas/barcelona.webp",
  "/img/fondos/destacadas/madrid.webp",
  "/img/fondos/destacadas/españa.webp",
  "/img/fondos/destacadas/brasil.webp",
  "/img/fondos/destacadas/madrid2.webp",
  "/img/fondos/destacadas/venezia.webp",
  "/img/fondos/destacadas/venezia2.webp",
];

const Tienda = () => {
  return (
    <main className="main-tienda">
      <h1>Camisetas destacadas</h1>
      <Destacadas images={destacadas} autoScrollSpeed={30}/>
      <Buscador />
      <section className="top-ventas">
        
      </section>
    </main>
  );
};

export default Tienda;
