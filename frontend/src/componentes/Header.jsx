import '../css/Header.css';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const toggleMenu = () => {
    setMenuOpen(!menuOpen);
  };

  return (
    <header>
      <div className="hamburger-menu" onClick={toggleMenu}>
        <img src="/icons/burger-bar.svg" alt="Menu" />
        <ul className={`menu ${menuOpen ? 'show' : ''}`} onClick={(e) => e.stopPropagation()}>
          <li><Link to="/tienda" onClick={toggleMenu}>Tienda</Link></li>
          <li><Link to="/a" onClick={toggleMenu}>Marcador</Link></li>
          <li><Link to="/a" onClick={toggleMenu}>Fantasy</Link></li>
          <li><Link to="/a" onClick={toggleMenu}>Perfil</Link></li>
        </ul>
      </div>

      <Link to="/">
        <figure className="logo">
          <img src="/img/logo.png" alt="Logo" />
        </figure>
      </Link>

      <nav className="nav">
        <ul>
          <li><Link to="/tienda">Tienda</Link></li>
          <li><Link to="/a">Marcador</Link></li>
          <li><Link to="/a">Fantasy</Link></li>
          <li><Link to="/a">Perfil</Link></li>
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
