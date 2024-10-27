import React from "react";
import '../css/Footer.css';

const Footer = () => {
return (
  <footer>
    <div className="copyright">
      <p>Copyright &copy; 2024, All Rights Reserved</p>
      <a href="#">Aviso legal</a>
    </div>
    <div className="location">
      <img src="../../public/icons/location-pin.svg" alt="Icono de ubicacion" />
      <p>Localización</p>
      <p>Av. Avenida nº0, Poblacion, Procinvia</p>
    </div>
    <div className="contact">
      <img src="../../public/icons/contact-us.svg" alt="Icono de contacto" />
      <p>Contacto</p>
      <p>666 666 666 / contacto@email.es</p>
    </div>
    <div className="social-media">
      <a href="#" alt="Instagram"><img src="../../public/icons/instagram.svg" alt="Instagram" /></a>
      <a href="" alt="Twitter"><img src="../../public/icons/twitter.svg" alt="Twitter" /></a>
      <a href="" alt="TikTok"><img src="../../public/icons/tik-tok.svg" alt="TikTok" /></a>
    </div>
  </footer>
);
};

export default Footer;