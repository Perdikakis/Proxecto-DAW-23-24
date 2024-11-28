import React from 'react';

const CardCamisetaCarrito = ({ data }) => {
  console.log(data);

  return (
    <article className='card-camiseta-carrito'>
        <div className='img'>
            <img src="" alt="icon1" />
            <img src="" alt="icon2" />
            <figure>
                <img src="" alt="camiseta" />
            </figure>
        </div>
        <div className='datos'>
            <span>Camiseta</span>
            <span>Precio og</span>
            <span>Precio</span>
            <button>Detalles</button>
        </div>
    </article>
  );
};

export default CardCamisetaCarrito;