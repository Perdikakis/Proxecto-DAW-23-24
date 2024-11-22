import React, { useEffect, useRef } from "react";
import '../css/Camiseta.css';
import { useParams } from "react-router-dom";
import CardCamiseta from "./CardCamiseta";

const Camiseta = () => {
  const { id } = useParams();
  const imagesRef = useRef(null);
  const mainRef = useRef(null);

  useEffect(() => {
    const imagesContainer = imagesRef.current;
    const mainContainer = mainRef.current;

    if (imagesContainer && mainContainer) {
      const cardCamiseta = imagesContainer.querySelector('.card-camiseta');
      const cardCamisetaOffset = cardCamiseta.offsetLeft;
      const cardCamisetaWidth = cardCamiseta.offsetWidth;
      const mainWidth = mainContainer.offsetWidth;

      // Calcula el desplazamiento para que la tarjeta esté centrada en el main
      const scrollLeft = cardCamisetaOffset - (mainWidth / 2) + (cardCamisetaWidth / 2);

      imagesContainer.scrollLeft = scrollLeft;
    }
  }, []);

  return (
    <main className="main-camiseta" ref={mainRef}>
      <section className="images" ref={imagesRef}>
        <figure className="image">
          <img src="/img/fondos/camisetas/barcelona-3.webp" alt="" />
        </figure>
        <figure className="image">
          <img src="/img/fondos/camisetas/barcelona-1.webp" alt="" />
        </figure>
        <CardCamiseta id={id} />
        <figure className="image">
          <img src="/img/fondos/camisetas/barcelona-2.webp" alt="" />
        </figure>
        <figure className="image">
          <img src="/img/fondos/camisetas/barcelona-4.webp" alt="" />
        </figure>
      </section>
      <section>

      </section>
    </main>
  );
};

export default Camiseta;