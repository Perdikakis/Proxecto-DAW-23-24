import React, { useState } from "react";
import '../css/CardCamiseta.css';
import { Link } from "react-router-dom";

const CardCamiseta = ({ data }) => {
  const [starIcon, setStarIcon] = useState("/icons/star.svg");

  const clickFavoritos = (e) => {
    e.stopPropagation();
    setStarIcon(prevIcon => prevIcon === "/icons/star.svg" ? "/icons/star2.svg" : "/icons/star.svg");
  };

  return (
    <div className="card-camiseta">
      <img 
        src={starIcon} 
        alt="Favoritos"
        className="icon-top-left" 
        onClick={clickFavoritos} 
      />
      <img src="/icons/addCart.svg" alt="Comprar" className="icon-top-right"/>
      
      <Link to={`/camiseta/${data.id}`}>
        <figure>
          <img src={data.imagenes[0]} alt={data.equipo+" "+data.nombre} className="camiseta-img" />
        </figure>
        <div className="info-container">
          <div className="info-left">{`€${(data.precio * 5).toFixed(2)}`}</div>
          <div className="info-right">{`€${data.precio}`}</div>
        </div>
        <div className="bottom-text">{data.equipo} {data.nombre} {data.temporada}</div>
      </Link>
    </div>
  );
};

export default CardCamiseta;