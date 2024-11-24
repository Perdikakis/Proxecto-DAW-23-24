import React, { useState } from "react";
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
  const [resultadosBusqueda, setResultadosBusqueda] = useState([]);
  const [mostrarResultados, setMostrarResultados] = useState(false);

  return (
    <main className="main-tienda">
      <h1>Camisetas destacadas</h1>
      <Destacadas images={destacadas} autoScrollSpeed={30}/>
      <Buscador />
      {mostrarResultados ? (
        <section className="resultados-busqueda">
          <h2>Resultados de la búsqueda</h2>
          <ul>
            {resultadosBusqueda.map((resultado) => (
              <li key={resultado.id}>{resultado.nombre}</li>
            ))}
          </ul>
        </section>
      ) : (
        <section className="top-ventas">
          <TopVentas liga="La Liga"/>
          <TopVentas liga="Premier League"/>
          <TopVentas liga="Selecciones"/>  
        </section>
      )}
    </main>
  );
};

export default Tienda;
