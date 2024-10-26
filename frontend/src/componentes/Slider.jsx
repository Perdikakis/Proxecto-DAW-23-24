import '../css/Slider.css';
import React, { useEffect, useState, useRef } from 'react';

const Slider = ({ images, autoScrollSpeed }) => {

  const [currentIndex, setCurrentIndex] = useState(0);
  const sliderRef = useRef(null);

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, autoScrollSpeed);

    return () => clearInterval(interval);
  }, [images.length]);

  useEffect(() => {
    if (sliderRef.current) {
      sliderRef.current.scrollTo({
        left: currentIndex * sliderRef.current.clientWidth,
        behavior: 'smooth'
      });
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