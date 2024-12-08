import React, { useEffect, useState } from "react";
import '../css/TopVentas.css';
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";
import { ajaxAxios } from "../utils/ajaxAxios";
import { getCookie, setCookie, eraseCookie } from "../utils/cookies";

const TopVentas = ({ nombre, id, onVerMas }) => {
  const [topVentas, setTopVentas] = useState(() => {
    const topVentasCookie = getCookie(`topVentas_${id}`);
    return topVentasCookie ? JSON.parse(topVentasCookie) : null;
  });

  const [topVentasIds, setTopVentasIds] = useState(() => {
    const topVentasIdsCookie = getCookie(`topVentasIds_${id}`);
    return topVentasIdsCookie ? JSON.parse(topVentasIdsCookie) : null;
  });

  useEffect(() => {
    if (!topVentas || !topVentasIds) {
      ajaxAxios({
        url: `${import.meta.env.VITE_API_URL}/top-ventas`,
        method: 'POST',
        data: { idCompeticion: id },
        fsuccess: (data) => {
          setTopVentas(data.camisetas);
          setTopVentasIds(data.ids);
          setCookie(`topVentas_${id}`, JSON.stringify(data.camisetas), 1 / 24); // 1 hora
          setCookie(`topVentasIds_${id}`, JSON.stringify(data.ids), 1 / 24);
        },
        ferror: (error) => {
        }
      });
    }
  }, [id, topVentas, topVentasIds]);

  const handleBusqueda = () => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/camisetasFiltradas`,
      method: 'POST',
      data: { camisetas_ids: topVentasIds },
      fsuccess: (data) => {
        onVerMas(data, topVentasIds);
      },
      ferror: (error) => {
      }
    });
  }

  return (
    <article className="top">
      <h2>Top Ventas {nombre}</h2>
      {topVentas && topVentas.length > 0 && (
        topVentas.map((camiseta) => (
          <CardCamiseta key={camiseta.id} data={camiseta} />
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
