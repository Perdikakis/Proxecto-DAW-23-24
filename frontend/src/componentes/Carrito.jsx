import React, { useState, useEffect } from 'react';
import CardCamisetaCarrito from './CardCamisetaCarrito';
import '../css/Carrito.css';
import BotonBlanco from './BotonBlanco';
import { useNavigate } from 'react-router-dom';

const Carrito = ({ initialCarrito }) => {
    const [carrito, setCarrito] = useState(initialCarrito || []);
    const [detallesAbiertos, setDetallesAbiertos] = useState(false);
    const [alerta, setAlerta] = useState(false);
    const [barraProgreso, setBarraProgreso] = useState(100);
    const navigate = useNavigate();

    useEffect(() => {
        const carritoLocal = localStorage.getItem('carrito');
        if (carritoLocal && carritoLocal.length > 0) {
            setCarrito(JSON.parse(carritoLocal));
        }
    }, []);

    const handleDetallesAbiertos = (estado) => {
        setDetallesAbiertos(estado);
      };

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

    const vaciarCarrito = () => {
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

        setCarrito([]);
        localStorage.removeItem('carrito');
    }

    const handlePedir = () => {
        navigate('realizar-pago');
    }

    return (
        <section className="main-carrito">
            {alerta && 
                <div className="alert-container">
                    <div className="alert alert-danger" role="alert">
                        {'Producto(s) borrado(s) correctamente'}
                        <div className="progress-bar-error" style={{ width: `${barraProgreso}%` }}></div>
                    </div>
                </div>
            }
            {carrito.length > 0 && (
                <article className='carrito-controles'>
                    <BotonBlanco
                        texto="pedir"
                        icono='/icons/booking.svg'
                        iconoHover='/icons/booking1.svg'
                        disabled={false}
                        mainColor='#379342'
                        onClick={handlePedir}
                    />
                    <BotonBlanco
                        texto="vaciar"
                        icono='/icons/trash.svg'
                        iconoHover='/icons/trash1.svg'
                        disabled={false}
                        mainColor='#D63030'
                        onClick={vaciarCarrito}
                    />
                </article>
            )}
            {carrito.length > 0 ? (
                <>
                    {carrito.map((producto, idx) => (
                        <CardCamisetaCarrito
                        key={idx}
                        data={producto}
                        idx={idx}
                        actualizarCarrito={actualizarCarrito}
                        detallesAbiertos={detallesAbiertos}
                        handleDetallesAbiertos={handleDetallesAbiertos}
                        />
                    ))}
                </>
            ) : (
                <p>No hay productos en el carrito</p>
            )}
        </section>
    );
};

export default Carrito;