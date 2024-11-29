import React from 'react';
import '../css/BotonBlanco.css';
import { useState } from 'react';

const BotonBlanco = ({ texto, icono, iconoHover, disabled, onClick }) => {
  const [iconoVisible, setIconoVisible] = useState(true);
  const [iconoHoverVisible, setIconoHoverVisible] = useState(true);

  const handleIconoError = () => {
    setIconoVisible(false);
  };

  const handleIconoHoverError = () => {
    setIconoHoverVisible(false);
  };

  return (
    <button 
      className={`botonBlanco ${disabled ? 'boton-disabled' : ''}`} 
      disabled={disabled}
      onClick={onClick}
    >
      <div className='wrapper'>
        <figure className="icono">
          <img src={icono} className="icono-default" onError={handleIconoError}/>
          <img src={iconoHover} className="icono-hover" onError={handleIconoHoverError}/>
        </figure>
        <span>{texto}</span>
      </div>
    </button>
  );
};

export default BotonBlanco;