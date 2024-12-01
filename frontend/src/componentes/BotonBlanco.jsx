import React from 'react';
import '../css/BotonBlanco.css';
import { useState } from 'react';

const BotonBlanco = ({ texto, icono, iconoHover, disabled, onClick, mainColor='' }) => {
  

  const [iconoVisible, setIconoVisible] = useState(true);
  const [iconoHoverVisible, setIconoHoverVisible] = useState(true);
  const color = useState(mainColor);

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
      style={{ backgroundColor: mainColor}}
    >
      <div className='wrapper'>
        {icono!=null && (
          <figure className="icono">
            {iconoVisible && <img src={icono} className="icono-default" onError={handleIconoError} />}
            {iconoHoverVisible && <img src={iconoHover} className="icono-hover" onError={handleIconoHoverError} />}
          </figure>
        )}
        <span>{texto}</span>
      </div>
    </button>
  );
};

export default BotonBlanco;