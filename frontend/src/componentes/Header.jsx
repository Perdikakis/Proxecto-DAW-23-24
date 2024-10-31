import '../css/Header.css';
import React, { useState } from 'react';

const Header = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const toggleMenu = () => {
    setMenuOpen(!menuOpen);
  };

  return (
    <header>
      <div className="hamburger-menu" onClick={toggleMenu}>
        <img src="/icons/burger-bar.svg" alt="Menu" />
        <ul className={`menu ${menuOpen ? 'show' : ''}`}>
            <li><a href="#">Tienda</a></li>
            <li><a href="#">Marcador</a></li>
            <li><a href="#">Fantasy</a></li>
            <li><a href="#">Perfil</a></li>
        </ul>
      </div>

      <figure className="logo">
        <img src="/img/logo.png" alt="Logo" />
      </figure>

      <nav className="nav">
        <ul>
            <li><a href="#">Tienda</a></li>
            <li><a href="#">Marcador</a></li>
            <li><a href="#">Fantasy</a></li>
            <li><a href="#">Perfil</a></li>
        </ul>
      </nav>

      <div className="carrito">
        <img src="/icons/basket.svg" alt="Carrito" className="carrito-default"/>
        <img src="/icons/basket1.svg" alt="Carrito Hover" className="carrito-hover" />
      </div>

    </header>
  );
};

export default Header;