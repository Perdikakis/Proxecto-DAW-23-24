import React, { useEffect, useRef, useState } from "react";
import '../css/Camiseta.css';
import { useParams } from "react-router-dom";
import CardCamiseta from "./CardCamiseta";
import BotonBlanco from "./BotonBlanco";
import { ajaxAxios } from "../utils/ajaxAxios";

const Camiseta = () => {
  const { id } = useParams();
  const imagesRef = useRef(null);
  const mainRef = useRef(null);
  const [isButtonDisabled, setIsButtonDisabled] = useState(true);

  const [talla, setTalla] = useState('');
  const [sugerenciasTalla, setSugerenciasTalla] = useState([]);
  const [tallaValida, setTallaValida] = useState(false);

  const [tallas, setTallas] = useState([]);

  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/tallas`,
      method: 'GET',
      fsuccess: (data) => {
        setTallas(data);
        console.log('Tallas:', data);
      },
      ferror: (error) => {
        console.error('Error fetching tallas:', error);
      }
    });
  }, []);

  useEffect(() => {
    const imagesContainer = imagesRef.current;
    const mainContainer = mainRef.current;

    if (imagesContainer && mainContainer) {
      const cardCamiseta = imagesContainer.querySelector('.card-camiseta');
      const cardCamisetaOffset = cardCamiseta.offsetLeft;
      const cardCamisetaWidth = cardCamiseta.offsetWidth;
      const mainWidth = mainContainer.offsetWidth;

      const scrollLeft = cardCamisetaOffset - (mainWidth / 2) + (cardCamisetaWidth / 2);

      imagesContainer.scrollLeft = scrollLeft;
    }
  }, []);

  const validarNombre = () => {
    const nombre = document.getElementById('nombre').value;
    const regex = /^[\p{L}]{1,16}$/u;
    const isValid = regex.test(nombre.trim());
    document.getElementById('nombre').className = isValid ? 'input-valido' : 'input-invalido';
    return isValid;
  };

  const validarDorsal = () => {
    const dorsal = document.getElementById('dorsal').value;
    const dorsalNumero = parseInt(dorsal, 10);
    const isValid = dorsal.trim() !== '' && !isNaN(dorsalNumero) && dorsalNumero >= 0 && dorsalNumero <= 99;
    document.getElementById('dorsal').className = isValid ? 'input-valido' : 'input-invalido';
    return isValid;
  };

  const validarTalla = () => {
    const talla = document.getElementById('talla').value;
    const isValid = tallas.includes(talla);
    document.getElementById('talla').className = isValid ? 'input-valido' : 'input-invalido';
    return isValid;
  };

  const validarCantidad = () => {
    const cantidad = document.getElementById('cantidad').value;
    const cantidadNumero = parseInt(cantidad, 10);
    const isValid = cantidad.trim() !== '' && !isNaN(cantidadNumero) && cantidadNumero > 0;
    document.getElementById('cantidad').className = isValid ? 'input-valido' : 'input-invalido';
    return isValid;
  };

  const validarEnvio = () => {
    if (validarNombre() && validarDorsal() && validarTalla() && validarCantidad()) {
      setIsButtonDisabled(false);
    } else {
      setIsButtonDisabled(true);
    }
  };

  const handleCambioTalla = (e) => {
    const value = e.target.value;
    setTalla(value);
    setSugerenciasTalla(tallas.filter(item => item.toLowerCase().includes(value.toLowerCase())));
    setTallaValida(tallas.includes(value));
    validarEnvio();
  };

  const handleFocus = (setSugerencias, sugerencias) => {
    setSugerencias(sugerencias);
  };

  const handleBlur = (clearSugerencias) => {
    setTimeout(() => clearSugerencias([]), 1); // Timeout porque al hacer clic en el desplegable, este se cierra antes de que pueda seleccionarse algo
  };

  const renderTallas = (sugerencias) => {
    return sugerencias.length > 0 && (
      <ul className="tallas">
        {sugerencias.map((item, index) => (
          <li 
            key={index} 
            onMouseDown={() => handleSugerenciaClick(item, setTalla, setSugerenciasTalla, setTallaValida)}>
            {item}
          </li>
        ))}
      </ul>
    );
  };

  const handleSugerenciaClick = (item, setValue, clearSugerencias, setValido) => {
    setValue(item);
    clearSugerencias([]);
    setValido(true);
    validarEnvio();
  };

  return (
    <main className="main-camiseta" ref={mainRef}>
      <section className="images" ref={imagesRef}>
        <figure className="image">
          <img src="/img/camisetas/barcelona-3.webp" alt="" />
        </figure>
        <figure className="image">
          <img src="/img/camisetas/barcelona-1.webp" alt="" />
        </figure>
        <CardCamiseta id={id} />
        <figure className="image">
          <img src="/img/camisetas/barcelona-2.webp" alt="" />
        </figure>
        <figure className="image">
          <img src="/img/camisetas/barcelona-4.webp" alt="" />
        </figure>
      </section>
      <section className="datos">
        <form className="formulario-camiseta">
          <div className="form-group">
            <label htmlFor="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" onChange={validarNombre} autoComplete="off"/>
          </div>
          <div className="form-group">
            <label htmlFor="dorsal">Dorsal:</label>
            <input type="text" id="dorsal" name="dorsal" onChange={validarDorsal} autoComplete="off"/>
          </div>
          <div className="form-group">
            <label htmlFor="talla">Talla:</label>
            <input 
              type="text" 
              id="talla" 
              value={talla} 
              onChange={(e) => handleCambioTalla(e)} 
              onFocus={() => handleFocus(setSugerenciasTalla, tallas)} 
              onBlur={() => handleBlur(setSugerenciasTalla)}
              autoComplete="off"
            />
            {renderTallas(sugerenciasTalla, "talla")}
          </div>
          <div className="form-group">
            <label htmlFor="cantidad">Cantidad:</label>
            <input type="number" id="cantidad" name="cantidad" onChange={validarEnvio} defaultValue={1} autoComplete="off"/>
          </div>
          <BotonBlanco 
            texto="añadir al carrito" 
            icono="/icons/add-to-cart.svg" 
            iconoHover="/icons/add-to-cart-1.svg" 
            disabled={isButtonDisabled} 
          />
        </form>
      </section>
    </main>
  );
};

export default Camiseta;