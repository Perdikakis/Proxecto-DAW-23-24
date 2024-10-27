import React from "react";
import '../css/Main.css';
import Slider from './Slider'

const Main = () => {
  const galeria1=[
    "../../public/img/fondos/galeria1/1.webp",
    "../../public/img/fondos/galeria1/2.webp",
    "../../public/img/fondos/galeria1/3.webp",
    "../../public/img/fondos/galeria1/4.webp",
    "../../public/img/fondos/galeria1/5.webp",
    "../../public/img/fondos/galeria1/6.webp",
  ];
  const galeria2=[
    "../../public/img/fondos/galeria2/1.webp",
    "../../public/img/fondos/galeria2/2.webp",
    "../../public/img/fondos/galeria2/3.webp",
    "../../public/img/fondos/galeria2/4.webp",
  ];

  return (
    <main>
      <Slider images={galeria1} autoScrollSpeed={3000} />
      <section className="main">
        <h1>consulta el catálogo completo</h1>
        <article className="caracteristicas">
          <div>
            <p>Sin costes extra</p>
            <img src="../../public/icons/box.svg" alt="Sin coste" />
            <p>0€ en costes de aduanas u otros impuestos</p>
          </div>
          <div>
            <p>Pagos seguros</p>
            <img src="../../public/icons/money.svg" alt="Pago" />
            <p>Pagos 100% seguros y devoluciones</p>
          </div>
          <div>
            <p>Envíos rápidos</p>
            <img src="../../public/icons/delivery-truck.svg" alt="Envio" />
            <p>Recibe tu pedido en un plazo de 5 a 10 días hábiles</p>
          </div>
        </article>
      </section>
      <Slider images={galeria2} autoScrollSpeed={3000} />
    </main>
  );
};

export default Main;