import React, { useState } from 'react';
import BotonBlanco from './BotonBlanco';
import '../css/CardCamisetaCarrito.css';

const CardCamisetaCarrito = ({ data }) => {
  const [starIcon, setStarIcon] = useState("/icons/star.svg");
  const [mostrarFormulario, setMostrarFormulario] = useState(false);
  const [nuevosDatos, setNuevosDatos] = useState({
    nombre: data.nombre,
    dorsal: data.dorsal,
    talla: data.talla,
    cantidad: data.cantidad
  });

  const handleDetalles = () => {
    setMostrarFormulario(true);
  }
  
  const handleCerrarFormulario = () => {
    setMostrarFormulario(false);
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNuevosDatos((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleGuardarDatos = (e) => {
    e.preventDefault();
    const nuevaData = {
      camiseta: data.camiseta,
      nombre: nuevosDatos.nombre,
      dorsal: nuevosDatos.dorsal,
      talla: nuevosDatos.talla,
      cantidad: nuevosDatos.cantidad
    }
    const carrito = JSON.parse(localStorage.getItem('carrito')) || [];
    const productoIndex = carrito.findIndex(
      (prod) => prod.camiseta.id === data.camiseta.id && prod.dorsal === data.dorsal && prod.talla === data.talla
    );
    if (productoIndex !== -1) {
      carrito[productoIndex] = nuevaData;
    } else {
      carrito.push(nuevaData);
    }
    console.log(nuevaData);
    localStorage.setItem('carrito', JSON.stringify(carrito));
    setMostrarFormulario(false);
  };

  const clickFavoritos = (e) => {
    e.stopPropagation();
    setStarIcon(prevIcon => prevIcon === "/icons/star.svg" ? "/icons/star2.svg" : "/icons/star.svg");
  };

  return (
    <article className='card-camiseta-carrito'>
        <div className='imagenes'>
        <img className="icon-top-left" src={starIcon} alt="Favoritos" onClick={clickFavoritos}/>
        <img className="icon-top-right" src="/icons/addCart.svg" alt="Eliminar"/>
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
              <label>
                Nombre:
                <input type="text" name="nombre" value={nuevosDatos.nombre} onChange={handleInputChange} />
              </label>
              <label>
                Dorsal:
                <input type="text" name="dorsal" value={nuevosDatos.dorsal} onChange={handleInputChange} />
              </label>
              <label>
                Talla:
                <input type="text" name="talla" value={nuevosDatos.talla} onChange={handleInputChange} />
              </label>
              <label>
                Cantidad:
                <input type="number" name="cantidad" value={nuevosDatos.cantidad} onChange={handleInputChange} />
              </label>
            </div>
            <div className='botones'>
              <button type="submit">V</button>
              <button type="button" onClick={handleCerrarFormulario}>X</button>
            </div>
          </form>
        </div>
      )}
    </article>
  );
};

export default CardCamisetaCarrito;