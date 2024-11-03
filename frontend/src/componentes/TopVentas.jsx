import React from "react";
import CardCamiseta from "./CardCamiseta";

const TopVentas = ({ liga }) => {
  return (
    <article>
        <h2>Top Ventas {liga}</h2>
        <CardCamiseta idCamiseta="1"/>
        <CardCamiseta idCamiseta="1"/>
        <CardCamiseta idCamiseta="1"/>
        <CardCamiseta idCamiseta="1"/>
    </article>
  );
};

export default TopVentas;
