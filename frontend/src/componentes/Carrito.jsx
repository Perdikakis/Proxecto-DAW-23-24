import React, { useState, useEffect } from 'react';
import CardCamisetaCarrito from './CardCamisetaCarrito';
import '../css/Carrito.css';

const Carrito = ({ initialCarrito }) => {
    const [carrito, setCarrito] = useState(initialCarrito || []);
    const [alerta, setAlerta] = useState(false);
    const [barraProgreso, setBarraProgreso] = useState(100);

    useEffect(() => {
        const carritoLocal = localStorage.getItem('carrito');
        if (carritoLocal && carritoLocal.length > 0) {
            setCarrito(JSON.parse(carritoLocal));
        }
    }, []);

    const actualizarCarrito = (nuevoCarrito) => {
        setAlerta(true);
        setBarraProgreso(100);
        const interval = setInterval(() => {
            setBarraProgreso((prev) => {
                if (prev <= 0) {
                    clearInterval(interval);
                    setAlerta(false);
                    return 0;
                }
                return prev - 1;
            });
        }, 30);

        setCarrito(nuevoCarrito);
        localStorage.setItem('carrito', JSON.stringify(nuevoCarrito));
    };

    return (
        <section className="carrito">
            {alerta && 
                <div className="alert-container">
                    <div className="alert alert-danger" role="alert">
                        {'Producto borrado correctamente'}
                        <div className="progress-bar-error" style={{ width: `${barraProgreso}%` }}></div>
                    </div>
                </div>
            }
            {carrito.length > 0 ? (
                carrito.map((producto, idx) => (
                    <CardCamisetaCarrito key={idx} data={producto} idx={idx} actualizarCarrito={actualizarCarrito} />
                ))
            ) : (
                <p>No hay productos en el carrito.</p>
            )}
        </section>
    );
};

export default Carrito;