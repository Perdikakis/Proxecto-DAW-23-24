import React, { useState } from "react";
import '../css/CardCamiseta.css';

const CardCamiseta = ({ id }) => {
  const [starIcon, setStarIcon] = useState("/icons/star.svg");

  const clickFavoritos = () => {
    setStarIcon(prevIcon => prevIcon === "/icons/star.svg" ? "/icons/star2.svg" : "/icons/star.svg");
  };

  return (
    <div className="card-camiseta">
      <figure>
        <img src="/img/fondos/destacadas/barcelona.webp" alt="" className="camiseta-img" />
      </figure>
      <img 
        src={starIcon} 
        alt="Star" 
        className="icon-top-left" 
        onClick={clickFavoritos} 
      />
      <img src="/icons/addCart.svg" alt="" className="icon-top-right"/>
      
      <div className="info-container">
        <div className="info-left">€100.00</div>
        <div className="info-right">€19.99</div>
      </div>
      <div className="bottom-text">EQUIPO LOCAL 22/23</div>
    </div>
  );
};

export default CardCamiseta;