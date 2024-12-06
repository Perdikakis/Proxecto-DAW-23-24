import '../css/Header.css';
import React, { useEffect, useState, useContext } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { AuthContext } from '../utils/AuthContext';

const Header = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const { isAuthenticated } = useContext(AuthContext);
  
  const navigate = useNavigate();

  const toggleMenu = () => {
    setMenuOpen(!menuOpen);
    const fixedButton = document.querySelector('#boton-catalogo-fixed');
    if (fixedButton) {
      fixedButton.style.display = menuOpen ? '' : 'none';
    }
  };

  const handleCarrito = () => {
    navigate('/perfil/carrito');
  }

  const handlePerfilClick = (e) => {
    if (!isAuthenticated) {
      e.preventDefault();
      navigate('/login');
    }
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
          <li><Link to="/perfil" onClick={handlePerfilClick}>Perfil</Link></li>
        </ul>
      </nav>

      <div className="carrito" onClick={handleCarrito}>
        <img src="/icons/basket.svg" alt="Carrito" className="carrito-default"/>
        <img src="/icons/basket1.svg" alt="Carrito Hover" className="carrito-hover" />
      </div>
    </header>
  );
};

export default Header;
