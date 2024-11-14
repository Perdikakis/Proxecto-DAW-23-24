import '../css/Slider.css';
import React, { useEffect, useState, useRef } from 'react';

const Slider = ({ images, autoScrollSpeed = 2000, id, nombreBoton }) => {

  const [currentIndex, setCurrentIndex] = useState(0);
  const sliderRef = useRef(null);

  // slide automatico
  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, autoScrollSpeed);

    return () => clearInterval(interval);
  }, [images.length, autoScrollSpeed]);

  // efecto "smooth" del slide
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

  // pequeño scroll inicial
  useEffect(() => { 
    if (sliderRef.current) { 
      const { clientHeight } = sliderRef.current; 
      window.scrollTo({ 
        top: sliderRef.current.offsetTop + clientHeight / 2 - window.innerHeight / 2, behavior: 'smooth' 
      }); 
    } 
  }, []);

  return (
    <div className="slider-container">
      <section className="slider" ref={sliderRef} aria-label="Slider Venezia" id={id}>
        {images.map((image, index) => (
          <figure key={index} className={`slide ${index === currentIndex ? 'active' : ''}`}>
            <img src={image} alt={`Imagen ${index + 1}`} />
            <figcaption>{`Image ${index + 1}`}</figcaption>
          </figure>
        ))}
      </section>
      <button className="boton">{nombreBoton}</button>
    </div>
  );
};

export default Slider;