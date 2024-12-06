import { useState } from "react";
import { Link, Routes, Route, useLocation } from "react-router-dom";
import '../css/Perfil.css';
import Carrito from "./Carrito";
import Pedidos from "./Pedidos";
import DatosPersonales from "./DatosPersonales";
import FormularioPedido from "./FormularioPedido";
import { useContext } from 'react';
import { AuthContext } from '../utils/AuthContext';
import { ajaxAxios } from "../utils/ajaxAxios";
import axios from "axios";

const Perfil = () => {
    const location = useLocation();
    const { user, logout } = useContext(AuthContext);
    const [selectedFile, setSelectedFile] = useState(null);

    const handleLogout = async () => {
        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/logout`,
            method: 'POST',
            fsuccess: (data) => {
                logout();
                navigate('/login');
            },
            ferror: (error) => {

            }
        });
    };

    const handleFileChange = (e) => {
        setSelectedFile(e.target.files[0]);
        handleUpload(e.target.files[0]);
    }

    const handleUpload = (file) => {
        const formData = new FormData();
        formData.append('image', file);

        const sessionToken = localStorage.getItem('session_token');

        axios(`${import.meta.env.VITE_API_URL}/upload`, {
        method: "POST",
        headers: {
            "Authorization": `Bearer ${sessionToken}`
        },
        data: formData
        })
        .then((resp) => {
            window.location.reload();
        })
        .catch((error) => {
            console.error("Error en la petición", error);
        });
    };


    const Favoritos = () => (
        <section className="favoritos">
            <p>No hay favoritos</p>
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
                    <figure className="logout" onClick={handleLogout}>
                        <img src="/icons/power.svg" alt="" className="icono-default"/>
                        <img src="/icons/power2.svg" alt="" className="icono-hover"/>
                    </figure>
                    <span>{user ? user.data.user.usuario : 'usuario'}</span>
                    <figure className="pfp" onClick={() => document.getElementById('fileInput').click()}>
                        {user.data.image ? <img src={user.data.image} alt=""/> : <img src="/icons/pfp.svg" alt=""/>}
                    </figure>
                    <input type="file" id="fileInput" style={{ display: 'none'}} onChange={handleFileChange}/>
                </div>
            </nav>
            <Routes>
                <Route path="ajustes" element={<DatosPersonales />} />
                <Route path="favoritos" element={<Favoritos />} />
                <Route path="pedidos" element={<Pedidos />} />
                <Route path="carrito" element={<Carrito />} />
                <Route path="carrito/realizar-pago" element={<FormularioPedido />} />
            </Routes>
        </main>
    );
};

export default Perfil;