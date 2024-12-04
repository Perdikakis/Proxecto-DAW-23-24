import React, { useEffect, useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { ajaxAxios } from '../utils/ajaxAxios';
import BotonBlanco from './BotonBlanco';
import '../css/FormularioPedido.css';

const FormularioPedido = ({ }) => {
    const [mensajeAlerta, setMensajeAlerta] = useState('');
    const [alertaExito, setAlertaExito] = useState('');
    const [barraProgreso, setBarraProgreso] = useState(100);
    const [mostrarLink, setMostrarLink] = useState(false);
    const [precioTotal, setPrecioTotal] = useState(0);
    const [carrito, setCarrito] = useState(JSON.parse(localStorage.getItem('carrito')));
    const navigate = useNavigate();
    const [navigateTo, setNavigateTo] = useState(null);
    const dialogRef = useRef(null);

    const [direccion, setDireccion] = useState('');
    const [poblacion, setPoblacion] = useState('');
    const [provincia, setProvincia] = useState('');
    const [codigoPostal, setCodigoPostal] = useState('');
    const [telefono, setTelefono] = useState('');
    const [error, setError] = useState('');
    
    const validarDireccion = () => {
        return direccion.trim() !== '';
    };

    const validarPoblacion = () => {
        return poblacion.trim() !== '';
    };

    const validarProvincia = () => {
        return provincia.trim() !== '';
    };

    const validarCodigoPostal = () => {
        const regex = /^[0-9]{5}$/;
        return regex.test(codigoPostal);
    };

    const validarTelefono = () => {
        const regex = /^[0-9]{9}$/;
        return regex.test(telefono);
    };
    
    //validar el pedido antes de rellenar formulario
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
                } else {
                    setPrecioTotal(data.precioTotal);
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

    // estado intermedio para evitar warning al redireccionar mientras se renderiza el componente
    useEffect(() => {
        if (navigateTo) {
            navigate(navigateTo);
            setNavigateTo(null);
        }
    }, [navigateTo, navigate]);    

    useEffect(() => {
        if(alertaExito) {
            const interval = setInterval(() => {
                setBarraProgreso((prev) => {
                if (prev <= 0) {
                    clearInterval(interval);
                    setAlertaExito('');
                    setNavigateTo('/perfil/pedidos');
                    return 0;
                }
                return prev - 1;
                });
            }, 30);
        }
    }, [alertaExito]);

    const volverCarrito = () => {
        dialogRef.current.close();
        navigate('/perfil/carrito')
    };

    const enviarDatosPago = (e) => {
        e.preventDefault();
        if (!validarDireccion()) {
            return setError('La dirección es inválida.');
        }
        if (!validarPoblacion()) {
            return setError('La población es inválida.');
        }
        if (!validarProvincia()) {
            return setError('La provincia es inválida.');
        }
        if (!validarCodigoPostal()) {
            return setError('El código postal es inválido.');
        }
        if (!validarTelefono()) {
            return setError('El teléfono es inválido.');
        }
    
        // Si todos los campos son válidos, puedes enviar el formulario
        setError('');
        const data = {
            carrito,
            direccion,
            poblacion,
            provincia,
            codigoPostal,
            telefono,
        };

        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/realizarPedido`,
            method: 'POST',
            data: { data },
            fsuccess: (data) => {
                if(data.success) {
                    setCarrito([]);
                    localStorage.setItem('carrito', JSON.stringify([]));
                    setAlertaExito('Pedido realizado con éxito');

                    setBarraProgreso(100);
                } else {
                    setError(data.message);
                }
            },
            ferror: (error) => {
                setError('Error al realizar el pedido');
            }
        });
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
            <h2>Información de envío</h2>
            <form>
                <fieldset className="form-group">
                    <label htmlFor="direccion">Direccion</label>
                    <input type="text" id="direccion" placeholder="Calle calle Nº1 19A" onChange={(e) => setDireccion(e.target.value)}/>
                </fieldset>
                <fieldset className="form-group">
                    <label htmlFor="poblacion">Población</label>
                    <input type="text" id="poblacion" placeholder="Caldas de Reis" onChange={(e) => setPoblacion(e.target.value)}/>
                </fieldset>
                <fieldset className="form-group">
                    <label htmlFor="provincia">Provincia</label>
                    <input type="text" id="provincia" placeholder="Pontevedra" onChange={(e) => setProvincia(e.target.value)}/>
                </fieldset>
                <fieldset className="form-group">
                    <label htmlFor="codigo_postal">Código postal</label>
                    <input type="text" id="codigo_postal" placeholder="36650" onChange={(e) => setCodigoPostal(e.target.value)}/>
                </fieldset>
                <fieldset className="form-group">
                    <label htmlFor="telefono">Teléfono</label>
                    <input type="text" id="telefono" placeholder="666666666" onChange={(e) => setTelefono(e.target.value)}/>
                </fieldset>
                {error && <p style={{ color: '#D63030', textAlign: 'center'}}>{error}</p>}
            </form>
            <section className="summary">
                <article className="summary-item">
                    <span>SUBTOTAL</span>
                    <span>€{Math.trunc((precioTotal-3.20) * 100) / 100}</span>
                </article>
                <article className="summary-item">
                    <span>ENVIO</span>
                    <span>€{3.20}</span>
                </article>
                <article className="summary-item total">
                    <span>TOTAL</span>
                    <span>€{Math.trunc((precioTotal) * 100) / 100}</span>
                </article>
            </section>
            {alertaExito && 
                <div className="alert-container">
                <div className="alert alert-success" role="alert">
                    {alertaExito}
                    <div className="progress-bar" style={{ width: `${barraProgreso}%` }}></div>
                </div>
            </div>}
            <BotonBlanco
                texto="confirmar pago"
                icono={null}
                iconoHover={null}
                disabled={false}
                onClick={enviarDatosPago}
            />
        </section>
    );
};

export default FormularioPedido;