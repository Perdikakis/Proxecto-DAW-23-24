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
    <div className="slider" ref={sliderRef}>
      {images.map((image, index) => (
        <div key={index} className="slide">
          <img src={image} alt={`Imagen ${index + 1}`} />
        </div>
      ))}
    </div>
  );
};

export default Slider;