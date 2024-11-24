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
          <li><Link to="/" onClick={toggleMenu}>Marcador</Link></li>
          <li><Link to="/" onClick={toggleMenu}>Fantasy</Link></li>
          <li><Link to="/perfil" onClick={toggleMenu}>Perfil</Link></li>
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
          <li><Link to="/">Marcador</Link></li>
          <li><Link to="/">Fantasy</Link></li>
          <li><Link to="/perfil">Perfil</Link></li>
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
