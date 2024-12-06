import React, { useState } from "react";
import '../css/CardCamiseta.css';
import { Link } from "react-router-dom";

const CardCamiseta = ({ data }) => {
  const [starIcon, setStarIcon] = useState("/icons/star.svg");

  const dataProducto= {camiseta: data,nombre: '', dorsal: '', talla: 'M', cantidad: 1};
  const [alertaExito, setAlertaExito] = useState(false);
  const [alertaError, setAlertaError] = useState(false);
  const [barraProgreso, setBarraProgreso] = useState(100);

  const clickFavoritos = (e) => {
    e.stopPropagation();
    setStarIcon(prevIcon => prevIcon === "/icons/star.svg" ? "/icons/star2.svg" : "/icons/star.svg");
  };

  const handleAddCarrito = (e) => {
    e.preventDefault(); 
    try {
      const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
      const productoExistente = carrito.find(
        (prod) => prod.camiseta.id === dataProducto.camiseta.id && prod.dorsal === dataProducto.dorsal && prod.talla === dataProducto.talla
      );
      if(productoExistente) {
        productoExistente.cantidad += dataProducto.cantidad;
      } else {
        carrito.push(dataProducto);
      }
      localStorage.setItem('carrito', JSON.stringify(carrito));
      
      setAlertaExito(true);
      setAlertaError(false);
      setBarraProgreso(100);
      const interval = setInterval(() => {
        setBarraProgreso((prev) => {
          if (prev <= 0) {
            clearInterval(interval);
            setAlertaExito(false);
            return 0;
          }
          return prev - 1;
        });
      }, 30);
    } catch (error) {
      setAlertaError(true);
      setAlertaExito(false);
      setBarraProgreso(100);
      const interval = setInterval(() => {
        setBarraProgreso((prev) => {
          if (prev <= 0) {
            clearInterval(interval);
            setAlertaError(false);
            return 0;
          }
          return prev - 1;
        });
      }, 30);
    }
  };

  return (
    <article className="card-camiseta">
      {alertaExito && 
      <div className="alert-container">
        <div className="alert alert-success" role="alert">
          {'Producto añadido al carrito'}
          <div className="progress-bar" style={{ width: `${barraProgreso}%` }}></div>
        </div>
      </div>}
      {alertaError && 
      <div className="alert-container">
        <div className="alert alert-danger" role="alert">
          {'Error al añadir el producto al carrito'}
          <div className="progress-bar-error" style={{ width: `${barraProgreso}%` }}></div>
        </div>
      </div>}
      <img 
        src={starIcon} 
        alt="Favoritos"
        className="icon-top-left" 
        onClick={clickFavoritos} 
      />
      <img src="/icons/addCart.svg" alt="Comprar" className="icon-top-right" onClick={handleAddCarrito}/>
      
      <Link to={`/camiseta/${data.id}`}>
        <figure>
          <img src={data.imagenes[0]} alt={data.equipo+" "+data.nombre}/>
        </figure>
        <div className="info-container">
          <div className="info-left">{`€${(data.precio * 5).toFixed(2)}`}</div>
          <div className="info-right">{`€${data.precio}`}</div>
        </div>
        <div className="bottom-text">{data.equipo} {data.nombre} {data.temporada}</div>
      </Link>
    </article>
  );
};

export default CardCamiseta;