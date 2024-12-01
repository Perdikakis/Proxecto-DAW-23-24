import React, { useEffect, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { ajaxAxios } from '../utils/ajaxAxios';
import BotonBlanco from './BotonBlanco';
import '../css/FormularioPedido.css';

const FormularioPedido = ({ }) => {
    const [mensajeAlerta, setMensajeAlerta] = useState('');
    const [barraProgreso, setBarraProgreso] = useState(100);
    const [mostrarLink, setMostrarLink] = useState(false);
    const carrito = JSON.parse(localStorage.getItem('carrito'));
    const navigate = useNavigate();
    const dialogRef = useRef(null);

    useEffect(() => {
        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/validarPedido`,
            method: 'POST',
            data: { carrito },
            fsuccess: (data) => {
                if (!data.success) {
                    setMensajeAlerta(data.message.replace(/\n/g, '<br />'));
                    dialogRef.current.style.setProperty('display', 'flex', 'important');
                    dialogRef.current.showModal();
                    setBarraProgreso(100);
                    const interval = setInterval(() => {
                      setBarraProgreso((prev) => {
                        if (prev <= 0) {
                          clearInterval(interval);
                          setMostrarLink(true);
                          return 0;
                        }
                        return prev - 1;
                      });
                    }, 30);
                  }
            },
            ferror: (error) => {
                setMensajeAlerta('Formato incorrecto de datos');
                dialogRef.current.showModal();
                setBarraProgreso(100);
                const interval = setInterval(() => {
                    setBarraProgreso((prev) => {
                        if (prev <= 0) {
                            clearInterval(interval);
                            setTimeout(() => {
                                navigate('/perfil/carrito');
                            }, 0);
                            return 0;
                        }
                        return prev - 1;
                    });
                }, 30);
            }
        });
    }, []);

    const volverCarrito = () => {
        dialogRef.current.close();
        navigate('/perfil/carrito')
    };

    return (
        <section className='main-pago'>
            <dialog ref={dialogRef} className="alert-dialog">
                <div className="alert alert-danger" role="alert">
                    <strong>{'Error al validar el pedido'}</strong>
                    <br />
                    <br />
                    <span dangerouslySetInnerHTML={{ __html: mensajeAlerta }} />
                    <div className="progress-bar-error" style={{ width: `${barraProgreso}%` }}></div>
                </div>
                {mostrarLink && (
                    <BotonBlanco
                    texto="regresar al carrito"
                    icono={null}
                    iconoHover={null}
                    disabled={false}
                    onClick={volverCarrito}
                    />
                )}
            </dialog>
            
            <form action="">
                <p>Datos pago</p>
            </form>
        </section>
    );
};

export default FormularioPedido;