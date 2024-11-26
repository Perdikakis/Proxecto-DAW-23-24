import React from "react";
import '../css/TopVentas.css';
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";

const TopVentas = ({ liga }) => {
  const dataEjemplo =
    {
      id: 1,
      imagenes: ["/img/fondos/destacadas/barcelona.webp"],
      equipo: "FC Barcelona",
      nombre: "LOCAL",
      estado: "normal",
      temporada: "23/24",
      precio: 19.99
    };
  return (
    <article className="top">
        <h2>Top Ventas {liga}</h2>
        <CardCamiseta data={dataEjemplo}/>
        <CardCamiseta data={dataEjemplo}/>
        <CardCamiseta data={dataEjemplo}/>
        <CardCamiseta data={dataEjemplo}/>
        <BotonBlanco 
        texto="ver más" 
        icono="/icons/application.svg" 
        iconoHover="/icons/application-hover.svg" 
        disabled={false} 
      />
    </article>
  );
};

export default TopVentas;
