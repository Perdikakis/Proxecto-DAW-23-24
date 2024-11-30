import React, { useEffect, useState } from "react";
import { Link, Routes, Route, useLocation } from "react-router-dom";
import '../css/Perfil.css';
import CardCamisetaCarrito from "./CardCamisetaCarrito";

const Perfil = () => {
    const [carrito, setCarrito] = useState([]);
    const location = useLocation();

    
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

    const Ajustes = () => (
        <section className="ajustes">
            <p>ajustes</p>
        </section>
    );

    const Favoritos = () => (
        <section className="favoritos">
            <p>favoritos</p>
        </section>
    );

    const Pedidos = () => (
        <section className="pedidos">
            <p>pedidos</p>
        </section>
    );

    const Carrito = () => (
        <section className="carrito">
            {alerta && 
                <div className="alert-container">
                <div className="alert alert-danger" role="alert">
                    {'Producto borrado correctamente'}
                    <div className="progress-bar-error" style={{ width: `${barraProgreso}%` }}></div>
                </div>
            </div>}
            {carrito.length > 0 ? (
                carrito.map((producto, idx) => (
                    <CardCamisetaCarrito key={idx} data={producto} idx={idx} actualizarCarrito={actualizarCarrito}/>
                ))
            ) : (
                <p>No hay productos en el carrito.</p>
            )}
        </section>
    );

    return (
        <main className="main-perfil">
            <nav className="panel">
                <div className="opciones">
                    <ul>
                        <li className={location.pathname === "/perfil/ajustes" ? "selected" : ""}>
                            <Link to="/perfil/ajustes">
                                <figure>
                                    <img src="/icons/ajustes.svg" alt="" />
                                </figure>
                                <span>Ajustes</span>
                            </Link>
                        </li>
                        <li className={location.pathname === "/perfil/favoritos" ? "selected" : ""}>
                            <Link to="/perfil/favoritos">
                                <figure>
                                    <img src="/icons/star3.svg" alt="" />
                                </figure>
                                <span>Favoritos</span>
                            </Link>
                        </li>
                        <li className={location.pathname === "/perfil/pedidos" ? "selected" : ""}>
                            <Link to="/perfil/pedidos">
                                <figure>
                                    <img src="/icons/pedidos.svg" alt="" />
                                </figure>
                                <span>Pedidos</span>
                            </Link>
                        </li>
                        <li className={location.pathname === "/perfil/carrito" ? "selected" : ""}>
                            <Link to="/perfil/carrito">
                                <figure>
                                    <img src="/icons/cart.svg" alt="" />
                                </figure>
                                <span>Carrito</span>
                            </Link>
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
            <Routes>
                <Route path="ajustes" element={<Ajustes />} />
                <Route path="favoritos" element={<Favoritos />} />
                <Route path="pedidos" element={<Pedidos />} />
                <Route path="carrito" element={<Carrito />} />
            </Routes>
        </main>
    );
};

export default Perfil;