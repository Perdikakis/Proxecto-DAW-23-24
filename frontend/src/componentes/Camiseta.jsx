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
  const [cantidadValida, setCantidadValida] = useState(true);
  const [dorsalValido, setDorsalValido] = useState(true);
  const [nombreValido, setNombreValido] = useState(false);

  const [tallas, setTallas] = useState([]);
  const [camisetaData, setCamisetaData] = useState(null);

  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/tallasCamiseta/${id}`,
      method: 'GET',
      fsuccess: (data) => {
        const formattedTallas = data.map((item) => `${item.talla} ${item.medidas}`);
        setTallas(formattedTallas);
      },
      ferror: (error) => {
        console.error('Error fetching tallas:', error);
      }
    });

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/camisetasFiltradas`,
      method: 'POST',
      data: { camiseta_id: id},
      fsuccess: (data) => {
        if (data.length > 0) {
          setCamisetaData(data[0]);
        } else {
          console.error(`Camiseta de id ${id} no encontrada.`);
        }
      },
      ferror: (error) => {
        console.error('Error fetching camiseta data:', error);
      }
    });
  }, []);

  useEffect(() => {
    const imagesContainer = imagesRef.current;
    const mainContainer = mainRef.current;
  
    if (imagesContainer && mainContainer) {
      const cardCamiseta = imagesContainer.querySelector('.card-camiseta');
      if (cardCamiseta) {
        const cardCamisetaOffset = cardCamiseta.offsetLeft;
        const cardCamisetaWidth = cardCamiseta.offsetWidth;
        const mainWidth = mainContainer.offsetWidth;
  
        const scrollLeft = cardCamisetaOffset - (mainWidth / 2) + (cardCamisetaWidth / 2);
  
        imagesContainer.scrollLeft = scrollLeft;
      }
    }
  }, [camisetaData]);

  const validarNombre = () => {
    const nombre = document.getElementById('nombre').value;
    const regex = /^[\p{L}]{1,16}$/u;
    const isValid = regex.test(nombre.trim());
    document.getElementById('nombre').className = isValid ? 'input-valido' : 'input-invalido';
    setNombreValido(isValid);
    validarEnvio();
  };

  const validarDorsal = () => {
    const dorsal = document.getElementById('dorsal').value;
    const dorsalNumero = parseInt(dorsal, 10);
    const isValid = dorsal.trim() !== '' && !isNaN(dorsalNumero) && dorsalNumero >= 0 && dorsalNumero <= 99;
    document.getElementById('dorsal').className = isValid ? 'input-valido' : 'input-invalido';
    setDorsalValido(isValid);
    validarEnvio();
  };

  const validarTalla = () => {
    const talla = document.getElementById('talla').value;
    const isValid = tallas.includes(talla);
    document.getElementById('talla').className = isValid ? 'input-valido' : 'input-invalido';
    setTallaValida(isValid);
    validarEnvio();
  };

  const validarCantidad = () => {
    const cantidad = document.getElementById('cantidad').value;
    const cantidadNumero = parseInt(cantidad, 10);
    const isValid = cantidad.trim() !== '' && !isNaN(cantidadNumero) && cantidadNumero > 0;
    document.getElementById('cantidad').className = isValid ? 'input-valido' : 'input-invalido';
    setCantidadValida(isValid);
    validarEnvio();
  };

  const validarEnvio = () => {
    if (nombreValido && dorsalValido && tallaValida && cantidadValida) {
      setIsButtonDisabled(false);
    } else {
      setIsButtonDisabled(true);
    }
  }

  const handleCambioTalla = (e) => {
    const value = e.target.value;
    setTalla(value);
    setSugerenciasTalla(tallas.filter(item => item.toLowerCase().includes(value.toLowerCase())));
    validarTalla();
  };

  const handleFocus = (setSugerencias, sugerencias) => {
    setSugerencias(sugerencias);
  };

  const handleBlur = (clearSugerencias) => {
    setTimeout(() => clearSugerencias([]), 1); // Timeout porque al hacer clic en el desplegable, este se cierra antes de que pueda seleccionarse algo
  };

  const handleSugerenciaClick = (item, setValue, clearSugerencias) => {
    setValue(item);
    clearSugerencias([]);
    setTimeout(() => validarTalla(), 1);
  };

  const renderTallas = (sugerencias) => {
    return sugerencias.length > 0 && (
      <ul className="tallas">
        {sugerencias.map((item, index) => (
          <li 
            key={index} 
            onMouseDown={() => handleSugerenciaClick(item, setTalla, setSugerenciasTalla)}>
            {item}
          </li>
        ))}
      </ul>
    );
  };

  const renderImagen = (num) =>{
    if (camisetaData && camisetaData.imagenes[num]) {
      return (
        <figure className="image">
          <img src={camisetaData.imagenes[num]} alt={`Imagen ${num}`} />
        </figure>
      );
    } else {
      return (
        <figure className="image">
        </figure>
      );
    }
  }

  return (
    <main className="main-camiseta" ref={mainRef}>
      <section className="images" ref={imagesRef}>
        {renderImagen(3)}
        {renderImagen(1)}
        {camisetaData ? <CardCamiseta data={camisetaData} /> : <p>Cargando datos de la camiseta...</p>}
        {renderImagen(2)}
        {renderImagen(4)}
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
            {renderTallas(sugerenciasTalla)}
          </div>
          <div className="form-group">
            <label htmlFor="cantidad">Cantidad:</label>
            <input type="number" id="cantidad" name="cantidad" onChange={validarCantidad} defaultValue={1} autoComplete="off"/>
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