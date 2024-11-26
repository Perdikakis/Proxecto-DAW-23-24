import React from 'react';
import '../css/BotonBlanco.css';

const BotonBlanco = ({ texto, icono, iconoHover, disabled, onClick }) => {
  return (
    <button 
      className={`botonBlanco ${disabled ? 'boton-disabled' : ''}`} 
      disabled={disabled}
      onClick={onClick}
    >
      <figure className="icono">
        <img src={icono} alt="Icono" className="icono-default" />
        <img src={iconoHover} alt="Icono Hover" className="icono-hover" />
      </figure>
      <span>{texto}</span>
    </button>
  );
};

export default BotonBlanco;