import React from "react";
import '../css/Tienda.css'
import Destacadas from "./Destacadas";
import Buscador from "./Buscador";
import TopVentas from "./TopVentas";

const Tienda = () => {
  return (
    <main className="main-tienda">
      <h1>Camisetas destacadas</h1>
      {/*<Destacadas />*/}
      <Buscador />
      <section className="top-ventas">
        
      </section>
    </main>
  );
};

export default Tienda;
