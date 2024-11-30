import React from "react";
import '../css/Footer.css';
import { useRef, useState, useEffect } from "react";

const Footer = () => {
  // margin-top dinamico para que el footer se sobreponga al contenido y se mantenga al final de la pagina
  const containerRef = useRef(null); 
  const [marginTop, setMarginTop] = useState(0); 
  useEffect(() => { 
    const updateMarginTop = () => { 
      const containerHeight = containerRef.current.offsetHeight; 
      if(window.innerWidth >= 514){
        setMarginTop(-containerHeight)
      } else {
        setMarginTop(0);
      }
    }; 

    const observer = new ResizeObserver(updateMarginTop); 
    observer.observe(containerRef.current); // Actualiza la primera vez que se monta el componente 
    updateMarginTop();
    return () => observer.disconnect();
   }, [containerRef]);

return (
  <footer ref={containerRef} style={{ marginTop: `${marginTop}px`}}>
    <section className="footerElements">
    <div className="copyright">
      <p>Copyright &copy; 2024, All Rights Reserved</p>
      <a href="">Aviso legal</a>
    </div>
    <div className="location">
      <img src="/icons/location-pin.svg" alt="Icono de ubicacion" />
      <p>Localización</p>
      <p>Av. Avenida nº0, Poblacion, Procinvia</p>
    </div>
    <div className="contact">
      <img src="/icons/contact-us.svg" alt="Icono de contacto" />
      <p>Contacto</p>
      <p>
        <a href="tel:+666666666" aria-label="Número de teléfono">666 666 666</a> / 
        <a href="mailto:contacto@email.es" aria-label="Correo electrónico"> contacto@email.es</a>
      </p>
    </div>
    <div className="social-media">
      <a href="#" alt="Instagram"><img src="/icons/instagram.svg" alt="Instagram" /></a>
      <a href="#" alt="Twitter"><img src="/icons/twitter.svg" alt="Twitter" /></a>
      <a href="#" alt="TikTok"><img src="/icons/tik-tok.svg" alt="TikTok" /></a>
    </div>
    </section>
  </footer>
);
};

export default Footer;