import '../css/Header.css';
import React, { useState } from 'react';

const Header = () => {
  return (
    <header>
      
      <div className="hamburger-menu">
        <img src="../public/icons/burger-bar.svg" alt="" />
      </div>

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
        <img src="../public/icons/basket.svg" alt="Carrito" className="icono-default"/>
        <img src="../public/icons/basket1.svg" alt="Carrito Hover" className="icono-hover" />
      </div>

    </header>
  );
};

export default Header;