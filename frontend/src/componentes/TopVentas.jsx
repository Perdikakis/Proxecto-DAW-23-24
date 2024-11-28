import React, { useEffect, useState } from "react";
import '../css/TopVentas.css';
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";
import { ajaxAxios } from "../utils/ajaxAxios";

const TopVentas = ({ nombre, id, onVerMas }) => {
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
      },
      ferror: (error) => {
        console.error('Error obteniendo top-ventas:', error);
      }
    });
  }, []);

  const handleBusqueda = () => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/camisetasFiltradas`,
      method: 'POST',
      data: { camisetas_ids: topVentasIds },
      fsuccess: (data) => {
        onVerMas(data, topVentasIds);
      },
      ferror: (error) => {
        console.error('Error mostrando top ventas:', error);
      }
    });
  }

  return (
    <article className="top">
      <h2>Top Ventas {nombre}</h2>
      {topVentas && topVentas.length > 0 && (
        topVentas.map((venta) => (
          <CardCamiseta key={venta.id} data={venta} />
        ))
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
