import React, { useEffect, useState } from "react";
import '../css/Perfil.css';
import CardCamisetaCarrito from "./CardCamisetaCarrito";

const Perfil = () => {
    const [mostrarCarrito, setMostrarCarrito] = useState(false);
    const [carrito, setCarrito] = useState([]);

    useEffect(() => {
        const carrito = localStorage.getItem('carrito');
        if (carrito) {
            setCarrito(JSON.parse(carrito));
        }
    }, []);

    const renderCarrito = () => {
        setMostrarCarrito(!mostrarCarrito);
    }

    return (
    <main className="main-perfil">
        <nav className="panel">
            <div className="opciones">
                <ul>
                    <li>
                        <figure>
                            <img src="/icons/ajustes.svg" alt="" />
                        </figure>
                        <span>Ajustes</span>
                    </li>
                    <li>
                        <figure>
                            <img src="/icons/star3.svg" alt="" />
                        </figure>
                        <span>Favoritos</span>
                    </li>
                    <li>
                        <figure>
                            <img src="/icons/pedidos.svg" alt="" />
                        </figure>
                        <span>Pedidos</span>
                    </li>
                    <li onClick={renderCarrito}>
                        <figure>
                            <img src="/icons/cart.svg" alt="" />
                        </figure>
                        <span>Carrito</span>
                    </li>
                </ul>
            </div>
            <div className="usuario">
                <figure className="logout">
                    <img src="/icons/power.svg" alt="" className="icono-default"/>
                    <img src="/icons/power2.png" alt="" className="icono-hover"/>
                </figure>
                <span>usuario</span>
                <figure>
                    <img src="/icons/pfp.svg" alt=""/>
                </figure>
            </div>
        </nav>
        {mostrarCarrito && Array.isArray(carrito) && (
            <section className="carrito">
                {carrito.map((producto, idx) => (
                    <CardCamisetaCarrito key={idx} data={producto} />
                ))}
            </section>
        )}
    </main>
    );
};

export default Perfil;