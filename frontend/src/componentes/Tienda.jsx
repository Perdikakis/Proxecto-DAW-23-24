import React, { useEffect, useState, useRef } from "react";
import '../css/Tienda.css'
import Destacadas from "./Destacadas";
import Buscador from "./Buscador";
import TopVentas from "./TopVentas";
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";


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
  useEffect(() => {
    //restablecer scroll del slider del landing
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }, []);
  
  const [resultadosBusqueda, setResultadosBusqueda] = useState([]);
  const [mostrarResultados, setMostrarResultados] = useState(false);
  const [aviso, setAviso] = useState('');

  const [paginaActual, setPaginaActual] = useState(1);
  const [resultadosPorPagina, setResultadosPorPagina] = useState(0);
  const gridRef = useRef(null);

  useEffect(() => {
    itemsPorPagina();
    window.addEventListener('resize', itemsPorPagina);
    return () => window.removeEventListener('resize', itemsPorPagina);
  }, [resultadosBusqueda]);

  const itemsPorPagina = () => {
    if (gridRef.current) {
      const gridWidth = gridRef.current.clientWidth;
      const itemWidth = 200;
      const gap = 16;
      const itemsFila = Math.floor((gridWidth + gap) / (itemWidth + gap));     
      const itemsPagina = itemsFila * 2;
      setResultadosPorPagina(itemsPagina);
    }
  };

  const handlePrevPage = () => {
    if (paginaActual > 1) {
      setPaginaActual(paginaActual - 1);
    }
  };

  const handleNextPage = () => {
    if (paginaActual * resultadosPorPagina < resultadosBusqueda.length) {
      setPaginaActual(paginaActual + 1);
    }
  };

  const startIndex = (paginaActual - 1) * resultadosPorPagina;
  const endIndex = startIndex + resultadosPorPagina
  const currentResults = resultadosBusqueda.slice(startIndex, endIndex);

  const handleResultadosBusqueda = (resultados, orden = resultados.map(resultado => resultado.id)) => {
    if (resultados.length === 0) {
      setAviso('No se encontraron resultados.');
      setMostrarResultados(false);
    } else {
      const resultadosOrdenados = orden.length > 0 ? orden.map(id => resultados.find(resultado => resultado.id === id)) : resultados;
      setResultadosBusqueda(resultadosOrdenados);
      setMostrarResultados(true);
      setAviso('');
      setPaginaActual(1);
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
            <div className="alert alert-warning" role="alert">
              {aviso}
            </div>
          </div>
        </section>
      )}
      {mostrarResultados ? (
        <section className="resultados-busqueda">
          <h2>Resultados de la búsqueda</h2>
          <div className="pagination-controls">
            <BotonBlanco 
            texto="anterior" 
            icono={null} 
            iconoHover={null} 
            disabled={paginaActual === 1}
            onClick={handlePrevPage}
            />
            <BotonBlanco 
            texto="siguiente" 
            icono={null}
            iconoHover={null}
            disabled={paginaActual * resultadosPorPagina >= resultadosBusqueda.length}
            onClick={handleNextPage}
            />
          </div>
          <div className="resultados-grid" ref={gridRef}>
            {currentResults.map((resultado) => (
              <CardCamiseta key={resultado.id} data={resultado} />
            ))}
          </div>
        </section>
      ) : (
        <section className="top-ventas">
          <TopVentas nombre="La Liga" id={1} onVerMas={handleResultadosBusqueda}/>
          <TopVentas nombre="Premier League" id={2} onVerMas={handleResultadosBusqueda}/>
          <TopVentas nombre="Serie A" id={3} onVerMas={handleResultadosBusqueda}/>
        </section>
      )}
    </main>
  );
};

export default Tienda;
