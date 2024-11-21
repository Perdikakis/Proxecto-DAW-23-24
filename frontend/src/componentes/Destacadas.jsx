import React, { useEffect, useRef } from 'react';
import '../css/Destacadas.css';

const Destacadas = ({ images, autoScrollSpeed = 2000 }) => {
  const destacadasRef = useRef(null);

  useEffect(() => {
    const destacadas = destacadasRef.current;

    const scroll = () => {
      if (destacadas) {
        destacadas.scrollLeft += 1;

        // reset scroll
        if (destacadas.scrollLeft >= destacadas.scrollWidth / 2) {
          destacadas.scrollLeft = 0;
        }
      }
    };

    // scroll auto (menor speed => mayor velodidad en este caso)
    const interval = setInterval(scroll, autoScrollSpeed);

    return () => clearInterval(interval);
  }, [autoScrollSpeed, images.length]);

  return (
    <section className="destacadas" ref={destacadasRef}>
      {/*images*2 => bulce 'infinito'*/[...images, ...images].map((image, index) => (
        <figure className="destacada" key={index}>
          <img src={image} alt={`Imagen ${index + 1}`} />
        </figure>
      ))}
    </section>
  );
};

export default Destacadas;