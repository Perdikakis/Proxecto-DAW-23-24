import React from "react";
import '../css/Header.css';

const Header = () => {
  return (
    <header>
      
      <nav className="nav">
        <ul>
            <li><a href="/">Tienda</a></li>
            <li><a href="/about">Marcador</a></li>
            <div className="logo">
                <img src="../public/img/logo.png" alt="Logo" />
            </div>
            <li><a href="/services">Fantasy</a></li>
            <li><a href="/contact">Perfil</a></li>
        </ul>
      </nav>

      <div className="carrito">
        <img src="../public/icons/basket.png" alt="Carrito" className="icono-default"/>
        <img src="../public/icons/basket1.png" alt="Carrito Hover" className="icono-hover" />
      </div>

    </header>
  );
};

export default Header;