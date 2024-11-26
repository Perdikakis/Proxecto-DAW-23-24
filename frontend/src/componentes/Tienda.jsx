import React, { useState } from "react";
import '../css/bootstrap-alerts.css';
import '../css/Tienda.css'
import Destacadas from "./Destacadas";
import Buscador from "./Buscador";
import TopVentas from "./TopVentas";
import CardCamiseta from "./CardCamiseta";


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
  const [aviso, setAviso] = useState('');

  const handleResultadosBusqueda = (resultados) => {
    if (resultados.length === 0) {
      setAviso('No se encontraron resultados.');
      setMostrarResultados(false);
    } else {
      setResultadosBusqueda(resultados);
      setMostrarResultados(true);
      setAviso('');
    }
  }

  return (
    <main className="main-tienda">
      <h1>Camisetas destacadas</h1>
      <Destacadas images={destacadas} autoScrollSpeed={30}/>
      <Buscador onResultadosBusqueda={handleResultadosBusqueda}/>
      {aviso && (
        <section className="resultados-busqueda">
          <div className="alert-container">
            <div className="alert alert-danger" role="alert">
              {aviso}
            </div>
          </div>
        </section>
      )}
      {mostrarResultados ? (
        <section className="resultados-busqueda">
          <h2>Resultados de la búsqueda</h2>
          <div className="resultados-grid">
            {resultadosBusqueda.map((resultado) => (
              <CardCamiseta key={resultado.id} data={resultado} />
            ))}
          </div>
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
