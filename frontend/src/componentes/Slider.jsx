import '../css/Slider.css';
import React, { useEffect, useState, useRef } from 'react';

const Slider = ({ images, autoScrollSpeed }) => {

  const [currentIndex, setCurrentIndex] = useState(0);
  const sliderRef = useRef(null);

  // cambia la imagen a mostrar cada autoScrollSpeed tiempo
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, autoScrollSpeed);

    return () => clearInterval(interval);
  }, [images.length, autoScrollSpeed]);

  // animacion al deslizar el carrusel
  useEffect(() => {
    if (sliderRef.current) {
      let start = sliderRef.current.scrollLeft;
      let end = currentIndex * sliderRef.current.clientWidth;
      let change = end - start;
      let duration = 1000;
      let startTime = performance.now();

      const animateScroll = (currentTime) => {
        let timeElapsed = currentTime - startTime;
        let progress = Math.min(timeElapsed / duration, 1);
        sliderRef.current.scrollLeft = start + change * progress;

        if (progress < 1) {
          requestAnimationFrame(animateScroll);
        }
      };

      requestAnimationFrame(animateScroll);
    }
  }, [currentIndex]);

  return (
    <section className="slider" ref={sliderRef} aria-label="Slider Venezia">
      {images.map((image, index) => (
        <figure key={index} className={`slide ${index === currentIndex ? 'active' : ''}`}>
          <img src={image} alt={`Imagen ${index + 1}`} />
          <figcaption>{`Image ${index+1}`}</figcaption>
        </figure>
      ))}
    </section>
  );
};

export default Slider;