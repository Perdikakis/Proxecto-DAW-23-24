import React from "react";
import '../css/Main.css';
import Slider from './Slider'

const Main = () => {
  const galeria1=[
    "../../public/img/fondos/galeria1/1.jpg",
    "../../public/img/fondos/galeria1/2.jpg",
    "../../public/img/fondos/galeria1/3.jpg",
    "../../public/img/fondos/galeria1/4.jpg",
    "../../public/img/fondos/galeria1/5.jpg",
    "../../public/img/fondos/galeria1/6.webp",
  ];

  return (
    <main>
      <Slider images={galeria1} autoScrollSpeed={3000} />
    </main>
  );
};

export default Main;