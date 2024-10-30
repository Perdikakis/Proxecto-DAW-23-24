import React from "react";
import '../css/Main.css';
import Slider from './Slider'

const Main = () => {
  const galeria1=[
    "/img/fondos/galeria1/1.webp",
    "/img/fondos/galeria1/2.webp",
    "/img/fondos/galeria1/3.webp",
    "/img/fondos/galeria1/4.webp",
    "/img/fondos/galeria1/5.webp",
    "/img/fondos/galeria1/6.webp",
  ];
  const galeria2=[
    "/img/fondos/galeria2/1.webp",
    "/img/fondos/galeria2/2.webp",
    "/img/fondos/galeria2/3.webp",
    "/img/fondos/galeria2/4.webp",
  ];

  return (
    <main>
      <button id="boton-catalogo-fixed">
        <figure><img src="/icons/search.svg" alt="Lupa" /></figure>
        <span>Buscar camisetas</span> 
      </button>
      <Slider images={galeria1} autoScrollSpeed={3000} />
      <section className="main">
        <h1>consulta el catálogo completo</h1>
        <article className="caracteristicas">
          <div>
            <p>Sin costes extra</p>
            <img src="/icons/box.svg" alt="Sin coste" />
            <p>0€ en costes de aduanas u otros impuestos</p>
          </div>
          <div>
            <p>Pagos seguros</p>
            <img src="/icons/money.svg" alt="Pago" />
            <p>Pagos 100% seguros y devoluciones</p>
          </div>
          <div>
            <p>Envíos rápidos</p>
            <img src="/icons/delivery-truck.svg" alt="Envio" />
            <p>Recibe tu pedido en un plazo de 5 a 10 días hábiles</p>
          </div>
        </article>
        <button id="boton-catalogo">
          <figure>
            <img src="/icons/tshirt1.svg" alt="Camiseta" className="camiseta-default"/>
            <img src="/icons/tshirt2.svg" alt="Camiseta Hover" className="camiseta-hover" />
          </figure>
          <span>Catálogo</span> 
        </button>
      </section>
      <Slider images={galeria2} autoScrollSpeed={3000} />
    </main>
  );
};

export default Main;