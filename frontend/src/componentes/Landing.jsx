import React from "react";
import { Link } from 'react-router-dom';
import '../css/Main.css';
import '../css/Landing.css'
import Slider from './Slider'
import Mosaico from "./Mosaico";

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
  const imageUrls = [
    "/img/fondos/mosaico/barcelona.webp",
    "/img/fondos/mosaico/spain.webp",
    "/img/fondos/mosaico/madrid.webp",
    "/img/fondos/mosaico/liverpool.webp",
    "/img/fondos/mosaico/united.webp",
    "/img/fondos/mosaico/inter.webp",
    "/img/fondos/mosaico/brasil.webp",
    "/img/fondos/mosaico/milan.webp",
  ];
  const hoverTexts = [ 
    'FC Barcelona 05/06', 
    'España 2010', 
    'Real Madrid 06/07', 
    'Liverpool FC 06/07', 
    'Manchester United 06/07',
    'Inter Milan 06/07', 
    'Brasil 2002', 
    'AC Milan 06/07', 
  ];

  const scrollToElement = (id) => { 
    document.getElementById(id).scrollIntoView({ 
      behavior: 'smooth' 
    }); 
  };

  

  return (
    <main>
      <Link to="/tienda">
        <button id="boton-catalogo-fixed">
          <figure><img src="/icons/search.svg" alt="Lupa" /></figure>
          <span>Buscar camisetas</span> 
        </button>
      </Link>
      <Slider images={galeria1} autoScrollSpeed={3000} id={"slider1"} nombreBoton={"Nueva coleccion Venezia FC"}/>
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
        <article id="galerias" className="caracteristicas">
          <div onClick={() => scrollToElement('mosaico')}>
            <p>Linea retro</p>
            <img src="/icons/car.png" alt="Sin coste" />
          </div>
          <div onClick={() => scrollToElement('slider1')}>
            <p>Conjunto Venezia FC</p>
            <img src="/icons/venice.png" alt="Sin coste" />
          </div>
          <div onClick={() => scrollToElement('slider2')}>
            <p>Real Madrid 24/25</p>
            <img src="/icons/real-madrid.png" alt="Sin coste" />
          </div>
        </article>
      </section>
      <Mosaico imageUrls={imageUrls} hoverTexts={hoverTexts} id={"mosaico"}/>
      <Slider images={galeria2} autoScrollSpeed={3000} id={"slider2"} nombreBoton={"Coleccion Real Madrid 24/25"}/>
    </main>
  );
};

export default Main;