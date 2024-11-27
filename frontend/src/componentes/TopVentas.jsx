import React, { useEffect, useState } from "react";
import '../css/TopVentas.css';
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";
import { ajaxAxios } from "../utils/ajaxAxios";

const TopVentas = ({ nombre, id, onVerMas }) => {
  const dataEjemplo ={
    id: 205,
    imagenes: ["/img/fondos/destacadas/barcelona.webp"],
    equipo: "FC Barcelona",
    nombre: "LOCAL",
    estado: "normal",
    temporada: "23/24",
    precio: 19.99
  };

  const [topVentas, setTopVentas] = useState(null);
  const [topVentasIds, setTopVentasIds] = useState(null);

  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/top-ventas`,
      method: 'POST',
      data: { idCompeticion: id },
      fsuccess: (data) => {
        setTopVentas(data.camisetas);
        setTopVentasIds(data.ids);
        console.log(data.ids);
      },
      ferror: (error) => {
        console.error('Error fetching top-ventas:', error);
      }
    });
  }, []);

  const handleBusqueda = () => {
    onVerMas(topVentasIds);
  }

  return (
    <article className="top">
      <h2>Top Ventas {nombre}</h2>
      {topVentas && topVentas.length > 0 ? (
        topVentas.map((venta) => (
          <CardCamiseta key={venta.id} data={venta} />
        ))
      ) : (
        <p>Cargando datos de las ventas...</p>
      )}
      <BotonBlanco 
        texto="ver mas" 
        icono="/icons/application.svg" 
        iconoHover="/icons/application-hover.svg" 
        disabled={false}
        onClick={handleBusqueda}
      />
    </article>
  );
};

export default TopVentas;
