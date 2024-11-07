import React, { useEffect, useState } from "react";
import '../css/Destacadas.css';

const Destacadas = ({ images, autoScrollSpeed }) => {
  

  

  return (
    <section className="destacadas">
      <div className="slider-container">
        {images.map((image, index) => (
          <figure className="destacada" key={index}>
            <img src={image} alt={`Imagen ${index}`}/>
          </figure>
        ))}
      </div>
    </section>
  );
};

export default Destacadas;
