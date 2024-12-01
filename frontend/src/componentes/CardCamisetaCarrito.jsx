import React, { useEffect, useState } from 'react';
import BotonBlanco from './BotonBlanco';
import '../css/CardCamisetaCarrito.css';
import { ajaxAxios } from '../utils/ajaxAxios';

const CardCamisetaCarrito = ({ data, idx, actualizarCarrito }) => {
  const [tallas, setTallas] = useState([]);
  const [isButtonDisabled, setIsButtonDisabled] = useState(false);

  const [tallaValida, setTallaValida] = useState(true);
  const [cantidadValida, setCantidadValida] = useState(true);
  const [dorsalValido, setDorsalValido] = useState(true);
  const [nombreValido, setNombreValido] = useState(true);
  
  const [starIcon, setStarIcon] = useState("/icons/star.svg");
  const [mostrarFormulario, setMostrarFormulario] = useState(false);
  const [nuevosDatos, setNuevosDatos] = useState({
    nombre: data.nombre,
    dorsal: data.dorsal,
    talla: data.talla,
    cantidad: data.cantidad
  });

  useEffect(() => {
    ajaxAxios({
      url: `${import.meta.env.VITE_API_URL}/tallasCamiseta/${data.camiseta.id}`,
      method: 'GET',
      fsuccess: (data) => {
        const tallas = data.map((item) => `${item.talla}`);
        setTallas(tallas);
      },
      ferror: (error) => {
        
      }
    });
  }, []);

  useEffect(() => {
    if (nombreValido && dorsalValido && tallaValida && cantidadValida) {
      setIsButtonDisabled(false);
    }
  }, [nombreValido, dorsalValido, tallaValida, cantidadValida]);

  const handleDetalles = () => {
    setMostrarFormulario(true);
  }
  
  const handleCerrarFormulario = () => {
    setMostrarFormulario(false);
  };

  const handleSumar = () =>{
    document.getElementById('cantidad').value++;
    validarCantidad();
  }

  const handleRestar = () =>{
    document.getElementById('cantidad').value--;
    validarCantidad();
  }

  const validarNombre = () => {
    const nombre = document.getElementById('nombre').value;
    const regex = /^[\p{L}]{0,16}$/u;
    const isValid = regex.test(nombre.trim());
    document.getElementById('nombre').className = isValid ? 'input-valido' : 'input-invalido';
    setNombreValido(isValid);
    if(isValid) {
      setNuevosDatos(prevDatos => ({...prevDatos, nombre: nombre}));
    }
  };

  const validarDorsal = () => {
    const dorsal = document.getElementById('dorsal').value;
    const dorsalNumero = parseInt(dorsal, 10);
    const isValid = dorsal.trim() === '' || (!isNaN(dorsalNumero) && dorsalNumero >= 0 && dorsalNumero <= 99);
    document.getElementById('dorsal').className = isValid ? 'input-valido' : 'input-invalido';
    setDorsalValido(isValid);
    if(isValid) {
      setNuevosDatos(prevDatos => ({...prevDatos, dorsal: dorsal}));
    }
  };

  const validarTalla = () => {
    const talla = document.getElementById('talla').value;
    const isValid = tallas.includes(talla);
    document.getElementById('talla').className = isValid ? 'input-valido' : 'input-invalido';
    setTallaValida(isValid);
    if(isValid) {
      setNuevosDatos(prevDatos => ({...prevDatos, talla: talla}));
    }
  };

  const validarCantidad = () => {
    const cantidad = document.getElementById('cantidad').value;
    const cantidadNumero = parseInt(cantidad, 10);
    const isValid = cantidad.trim() !== '' && !isNaN(cantidadNumero) && cantidadNumero > 0;
    document.getElementById('cantidad').className = isValid ? 'input-valido' : 'input-invalido';
    setCantidadValida(isValid);
    if(isValid) {
      setNuevosDatos(prevDatos => ({...prevDatos, cantidad: cantidad}));
    }
  };

  const handleGuardarDatos = (e) => {
    e.preventDefault();
    if (!nombreValido || !dorsalValido || !tallaValida || !cantidadValida) {
      return;
    } else {
      const nuevaData = {
        camiseta: data.camiseta,
        nombre: nuevosDatos.nombre,
        dorsal: nuevosDatos.dorsal,
        talla: nuevosDatos.talla,
        cantidad: nuevosDatos.cantidad
      };
      const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
      carrito[idx] = nuevaData;
      localStorage.setItem('carrito', JSON.stringify(carrito));
      setMostrarFormulario(false);
    }
  };

  const clickFavoritos = (e) => {
    e.stopPropagation();
    setStarIcon(prevIcon => prevIcon === "/icons/star.svg" ? "/icons/star2.svg" : "/icons/star.svg");
  };

  const handleDelete = () => {
    const nuevoCarrito = JSON.parse(localStorage.getItem('carrito')) || [];
    nuevoCarrito.splice(idx, 1);
    localStorage.setItem('carrito', JSON.stringify(nuevoCarrito));
    actualizarCarrito(nuevoCarrito);
  };

  return (
    <article className='card-camiseta-carrito'>
        <div className='imagenes'>
        <img className="icon-top-left" src={starIcon} alt="Favoritos" onClick={clickFavoritos}/>
        <img className="icon-top-right" src="/icons/bin.svg" alt="Eliminar" onClick={handleDelete}/>
        <figure>
            <img src={data.camiseta.imagenes[0]} alt="camiseta" />
        </figure>
      </div>
      <div className='datos'>
          <span>{data.camiseta.equipo}</span>
          <span>{`${data.camiseta.nombre} ${data.camiseta.temporada}`}</span>
          <span className='precio-og'>{`€${(data.camiseta.precio * 5).toFixed(2)}`}</span>
          <span className='precio'>{`€${data.camiseta.precio}`}</span>
          <BotonBlanco 
            texto="detalles" 
            icono='/icons/lapiz.svg' 
            iconoHover='/icons/lapiz1.svg'
            disabled={false}
            onClick={handleDetalles}
            />
      </div>
      {mostrarFormulario && (
        <div className="formulario-overlay">
          <form className="formulario-detalles" onSubmit={handleGuardarDatos}>
            <div className='campos'>
              <label htmlFor='nombre'>Nombre:</label>
              <input type="text" name="nombre" id="nombre" defaultValue={nuevosDatos.nombre} onChange={validarNombre} autoComplete="off"/>
              <label htmlFor='dorsal'>Dorsal:</label>
              <input type="text" name="dorsal" id="dorsal" defaultValue={nuevosDatos.dorsal} onChange={validarDorsal} autoComplete="off"/>
              <label htmlFor='talla'>Talla:</label>
              <input type="text" name="talla" id="talla" defaultValue={nuevosDatos.talla} onChange={validarTalla} autoComplete="off"/>
              <label htmlFor='cantidad'>Cantidad:</label>
              <div className='input-container'>
                <img className="minus" src="/icons/minus.svg" alt="restar" onClick={handleRestar}/>
                <input type="number" name="cantidad" id="cantidad" defaultValue={nuevosDatos.cantidad} onChange={validarCantidad} autoComplete="off"/>
                <img className="plus" src="/icons/plus.svg" alt="restar" onClick={handleSumar}/>
              </div>
            </div>
            <div className='botones'>
              <button type="submit" disabled={isButtonDisabled}>
                <img src="/icons/checked.svg" alt="enviar" />
              </button>
              <button type="button" onClick={handleCerrarFormulario}>
                <img src="/icons/delete.svg" alt="cerrar" />
              </button>
            </div>
          </form>
        </div>
      )}
    </article>
  );
};

export default CardCamisetaCarrito;