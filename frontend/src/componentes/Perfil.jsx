import React, { useEffect, useState } from "react";
import { Link, Routes, Route, useLocation } from "react-router-dom";
import '../css/Perfil.css';
import Carrito from "./Carrito";
import CardCamisetaCarrito from "./CardCamisetaCarrito";

const Perfil = () => {
    
    const location = useLocation();

    
    

    

    

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