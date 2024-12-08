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
  const [nombreValido, setNombreValido] = useState(true);

  const [tallas, setTallas] = useState([]);
  const [camisetaData, setCamisetaData] = useState(null);

  const [dataProducto, setDataProducto] = useState({camiseta: {},nombre: '', dorsal: '', talla: '', cantidad: 1});
  const [alertaExito, setAlertaExito] = useState(false);
  const [alertaError, setAlertaError] = useState(false);
  const [barraProgreso, setBarraProgreso] = useState(100);

  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/tallasCamiseta/${id}`,
      method: 'GET',
      fsuccess: (data) => {
        const formattedTallas = data.map((item) => `${item.talla} - Stock: ${item.stock}`);
        setTallas(formattedTallas);
      },
      ferror: (error) => {
        
      }
    });

    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/camisetasFiltradas`,
      method: 'POST',
      data: { camisetas_ids: [id]},
      fsuccess: (data) => {
        if (data.length > 0) {
          setCamisetaData(data[0]);
          dataProducto.camiseta = data[0];
        } else {
          
        }
      },
      ferror: (error) => {
        
      }
    });
  }, []);

  //scroll imagen principal en el centro para pantallas pequeñas
  useEffect(() => {
    const imagesContainer = imagesRef.current;
    const mainContainer = mainRef.current;
  
    if (imagesContainer && mainContainer) {
      const camisetMain = imagesContainer.querySelector('.mainimage');
      if (camisetMain) {
        const camisetMainOffset = camisetMain.offsetLeft;
        const camisetMainWidth = camisetMain.offsetWidth;
        const mainWidth = mainContainer.offsetWidth;
  
        const scrollLeft = camisetMainOffset - (mainWidth / 2) + (camisetMainWidth / 2);
  
        imagesContainer.scrollLeft = scrollLeft;
      }
    }
  }, [camisetaData]);

  useEffect(() => {
    validarEnvio();
  }, [tallaValida, cantidadValida, dorsalValido, nombreValido]);

  const validarNombre = () => {
    const nombre = document.getElementById('nombre').value;
    const regex = /^[\p{L}]{0,16}$/u;
    const isValid = regex.test(nombre.trim());
    document.getElementById('nombre').className = isValid ? 'input-valido' : 'input-invalido';
    setNombreValido(isValid);
    setDataProducto((prevData) => ({
      ...prevData,
      nombre: nombre,
    }));
  };

  const validarDorsal = () => {
    const dorsal = document.getElementById('dorsal').value;
    const dorsalNumero = parseInt(dorsal, 10);
    const isValid = dorsal.trim() === '' || (!isNaN(dorsalNumero) && dorsalNumero >= 0 && dorsalNumero <= 99);
    document.getElementById('dorsal').className = isValid ? 'input-valido' : 'input-invalido';
    setDorsalValido(isValid);
    setDataProducto((prevData) => ({
      ...prevData,
      dorsal: dorsal,
    }));
  };

  const validarTalla = () => {
    const tallaSeleccionada = document.getElementById('talla').value;
    const isValid = tallas.some(item => item.split(' ')[0] === tallaSeleccionada);
    document.getElementById('talla').className = isValid ? 'input-valido' : 'input-invalido';
    setTallaValida(isValid);
    validarCantidad();
    setDataProducto((prevData) => ({
      ...prevData,
      talla: tallaSeleccionada,
    }));
  };

  const validarCantidad = () => {
    const cantidad = document.getElementById('cantidad').value;
    const cantidadNumero = parseInt(cantidad, 10);
    const tallaSeleccionada = document.getElementById('talla').value.split(' ')[0];
    const talla = tallas.find(item => item.split(' ')[0] === tallaSeleccionada);
    const stockDisponible = talla ? parseInt(talla.split(' ')[3]) : null;

    const isValid = cantidad.trim() !== '' && !isNaN(cantidadNumero) && cantidadNumero > 0 && (stockDisponible === null || cantidadNumero <= stockDisponible);
    document.getElementById('cantidad').className = isValid ? 'input-valido' : 'input-invalido';
    setCantidadValida(isValid);
    setDataProducto((prevData) => ({
      ...prevData,
      cantidad: cantidad,
    }));
  };

  const validarEnvio = () => {
    if (nombreValido && dorsalValido && tallaValida && cantidadValida) {
      setIsButtonDisabled(false);
    } else {
      setIsButtonDisabled(true);
    }
  }

  const handleSumar = () =>{
    document.getElementById('cantidad').value++;
    validarCantidad();
  }

  const handleRestar = () =>{
    document.getElementById('cantidad').value--;
    validarCantidad();
  }

  const handleCambioTalla = (e) => {
    const value = e.target.value;
    setTalla(value);
    setSugerenciasTalla(tallas.filter(item => item.toLowerCase().includes(value.toLowerCase())));
    validarTalla();
    validarCantidad();
  };

  const handleFocus = (setSugerencias, sugerencias) => {
    setSugerencias(sugerencias);
  };

  const handleBlur = (clearSugerencias) => {
    setTimeout(() => clearSugerencias([]), 1); // Timeout porque al hacer clic en el desplegable, este se cierra antes de que pueda seleccionarse algo
  };

  const handleSugerenciaClick = (item, setValue, clearSugerencias) => {
    setValue(item.split(' ')[0]);
    clearSugerencias([]);
    setTimeout(() => validarTalla(), 1);
  };

  const handleAddCarrito = (e) => {
    e.preventDefault();
    
    try {
      const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
      
      const productoExistente = carrito.find(
        (prod) => prod.camiseta.id === dataProducto.camiseta.id && prod.dorsal === dataProducto.dorsal && prod.talla === dataProducto.talla && prod.nombre === dataProducto.nombre
      );
      
      if(productoExistente) {
        productoExistente.cantidad += dataProducto.cantidad;
      } else {
        carrito.push(dataProducto);
      }
      
      localStorage.setItem('carrito', JSON.stringify(carrito));
      
      setAlertaExito(true);
      setAlertaError(false);
      setBarraProgreso(100);
      const interval = setInterval(() => {
        setBarraProgreso((prev) => {
          if (prev <= 0) {
            clearInterval(interval);
            setAlertaExito(false);
            return 0;
          }
          return prev - 1;
        });
      }, 30);
    } catch (error) {
      
      setAlertaError(true);
      setAlertaExito(false);
      setBarraProgreso(100);
      const interval = setInterval(() => {
        setBarraProgreso((prev) => {
          if (prev <= 0) {
            clearInterval(interval);
            setAlertaError(false);
            return 0;
          }
          return prev - 1;
        });
      }, 30);
    }
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
      let clase;
      num === 0 ? clase = "image mainimage" : clase = "image";
      return (
        <figure className={clase}>
          <img src={camisetaData.imagenes[num]} alt={`Imagen ${num}`} />
        </figure>
      );
    } else {
      return (
        <figure className="image">
        </figure>
      );
    }
  };

  return (
    <main className="main-camiseta" ref={mainRef}>
      <section className="images" ref={imagesRef}>
        {renderImagen(3)}
        {renderImagen(1)}
        {renderImagen(0)}
        {renderImagen(2)}
        {renderImagen(4)}
      </section>
      <section className="info-camiseta">
        {camisetaData && (
          <article>
            <p>{`${camisetaData.equipo} ${camisetaData.nombre} ${camisetaData.temporada}`}</p>
            <p>{`€${camisetaData.precio}`}</p>
          </article>
        )}
      </section>
      <section className="datos">
        <form className="formulario-camiseta" onSubmit={handleAddCarrito}>
          <fieldset className="form-group">
            <label htmlFor="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" onChange={validarNombre} autoComplete="off"/>
          </fieldset>
          <fieldset className="form-group">
            <label htmlFor="dorsal">Dorsal:</label>
            <input type="text" id="dorsal" name="dorsal" onChange={validarDorsal} autoComplete="off"/>
          </fieldset>
          <fieldset className="form-group">
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
          </fieldset>
          <fieldset className="form-group">
            <label htmlFor="cantidad">Cantidad:</label>
            <div className="input-container">
              <img className="minus" src="/icons/minus.svg" alt="restar" onClick={handleRestar}/>
              <input type="number" id="cantidad" name="cantidad" onChange={validarCantidad} defaultValue={1} autoComplete="off"/>
              <img className="plus" src="/icons/plus.svg" alt="sumar" onClick={handleSumar}/>
            </div>
          </fieldset>
          <BotonBlanco 
            texto="añadir al carrito" 
            icono="/icons/add-to-cart.svg" 
            iconoHover="/icons/add-to-cart-1.svg" 
            disabled={isButtonDisabled} 
          />
        </form>
          {alertaExito && 
          <div className="alert-container">
            <div className="alert alert-success" role="alert">
              {'Producto añadido al carrito'}
              <div className="progress-bar" style={{ width: `${barraProgreso}%` }}></div>
            </div>
          </div>}
          {alertaError && 
          <div className="alert-container">
            <div className="alert alert-danger" role="alert">
              {'Error al añadir el producto al carrito'}
              <div className="progress-bar-error" style={{ width: `${barraProgreso}%` }}></div>
            </div>
          </div>}
      </section>
    </main>
  );
};

export default Camiseta;