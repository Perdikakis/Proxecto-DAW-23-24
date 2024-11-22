import React from "react";
import '../css/TopVentas.css';
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";

const TopVentas = ({ liga }) => {
  return (
    <article className="top">
        <h2>Top Ventas {liga}</h2>
        <CardCamiseta id={1}/>
        <CardCamiseta id={1}/>
        <CardCamiseta id={1}/>
        <CardCamiseta id={1}/>
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
