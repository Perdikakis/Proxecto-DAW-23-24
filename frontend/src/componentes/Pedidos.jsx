import React, { useEffect, useState } from 'react';
import { ajaxAxios } from '../utils/ajaxAxios';
import '../css/Pedidos.css';

const Carrito = () => {
    const [pedidos, setPedidos] = useState([]);
    const [tipoPedidos, setTipoPedidos] = useState('activos');
    const pedidosActivos = pedidos.filter(pedido => !pedido.fecha_finalizado);
    const pedidosFinalizados = pedidos.filter(pedido => pedido.fecha_finalizado);

    const [detallesPedido, setDetallesPedido] = useState(null);
    const [mostrarPopup, setMostrarPopup] = useState(false);
    const [productoIndex, setProductoIndex] = useState(0);

    useEffect(() => {
        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/pedidos`,
            method: 'GET',
            fsuccess: (data) => {
                setPedidos(data.pedidos);
            },
            ferror: (error) => {
            }
        });
    }, []);

    const handleDetallesPedido = (id) => {
        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/getDetallesPedido/${id}`,
            method: 'GET',
            fsuccess: (data) => {
                setDetallesPedido(data.pedido);
                setMostrarPopup(true);
                setProductoIndex(0);
            },
            ferror: (error) => {
            }
        });
    };

    const handleSiguienteProducto = () => {
        setProductoIndex((prevIndex) => (prevIndex + 1) % detallesPedido.camisetas.length);
    };

    const handleAnteriorProducto = () => {
        setProductoIndex((prevIndex) => (prevIndex - 1 + detallesPedido.camisetas.length) % detallesPedido.camisetas.length);
    };

    const handleCerrarPopup = () => {
        setMostrarPopup(false);
        setDetallesPedido(null);
    };

    return (
        <section className="main-pedidos">
            <nav>
                <button
                    className={tipoPedidos === 'activos' ? 'selected' : ''}
                    onClick={() => setTipoPedidos('activos')}
                >
                    Pedidos Activos
                </button>
                <button
                    className={tipoPedidos === 'finalizados' ? 'selected' : ''}
                    onClick={() => setTipoPedidos('finalizados')}
                >
                    Pedidos Finalizados
                </button>
            </nav>

            <article className="pedidos-lista">
                {tipoPedidos === 'activos' && (
                    pedidosActivos.length > 0 ? (
                        <table className="custom-table">
                            <thead>
                                <tr>
                                    <th>Nº pedido</th>
                                    <th>Fecha</th>
                                    <th>Entrega prevista</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {pedidosActivos.map(pedido => (
                                    <tr key={pedido.id}>
                                        <td>{pedido.id}</td>
                                        <td>{pedido.fecha_pedido.split(" ")[0]}</td>
                                        <td>{pedido.fecha_envio.split(" ")[0]}</td>
                                        <td><a onClick={() => handleDetallesPedido(pedido.id)}>Ver detalles</a></td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    ) : (
                        <p>No hay pedidos activos.</p>
                    )
                )}

                {tipoPedidos === 'finalizados' && (
                    pedidosFinalizados.length > 0 ? (
                        <table className="custom-table">
                            <thead>
                                <tr>
                                    <th>Nº pedido</th>
                                    <th>Fecha</th>
                                    <th>Entrega prevista</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {pedidosFinalizados.map(pedido => (
                                    <tr key={pedido.id}>
                                        <td>{pedido.id}</td>
                                        <td>{pedido.fecha_pedido.split(" ")[0]}</td>
                                        <td>{pedido.fecha_envio.split(" ")[0]}</td>
                                        <td><a onClick={() => handleDetallesPedido(pedido.id)}>Ver detalles</a></td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    ) : (
                        <p>No hay pedidos finalizados.</p>
                    )
                )}
            </article>
            {mostrarPopup && (
                <section className='popup'>
                    <div className="popup-inner">
                        <section className="popup-header">
                            <h2>Detalles del Pedido</h2>
                            <figure className="close-icon" onClick={handleCerrarPopup}>
                                <img src="/icons/delete.svg" alt="close" />
                            </figure>
                        </section>
                        <p><strong>ID:</strong> {detallesPedido.id}</p>
                        <p><strong>Fecha de Pedido:</strong> {detallesPedido.fecha_pedido.split(" ")[0]}</p>
                        <p><strong>Fecha de Envío:</strong> {detallesPedido.fecha_envio.split(" ")[0]}</p>
                        <p><strong>Precio total:</strong> €{detallesPedido.total}</p><br />
                        <p><strong>Productos:</strong></p>
                        <section className="productos">
                        {detallesPedido.camisetas.length > 0 && (
                            <article className="producto">
                                <p><strong>Equipo:</strong> {detallesPedido.camisetas[productoIndex].equipo}</p>
                                <p><strong>Versión:</strong> {detallesPedido.camisetas[productoIndex].version}</p>
                                <p><strong>Temporada:</strong> {detallesPedido.camisetas[productoIndex].temporada}</p>
                                <p>
                                <strong>Precio:</strong> €{detallesPedido.camisetas[productoIndex].precio} 
                                {detallesPedido.camisetas[productoIndex].cantidad > 1 
                                    ? ` | €${Math.trunc((detallesPedido.camisetas[productoIndex].precio * detallesPedido.camisetas[productoIndex].cantidad) * 100) / 100}` 
                                    : ''}
                                </p>
                                <p><strong>Nombre:</strong> {detallesPedido.camisetas[productoIndex].nombre || 'N/A'}</p>
                                <p><strong>Dorsal:</strong> {detallesPedido.camisetas[productoIndex].dorsal || 'N/A'}</p>
                                <p><strong>Cantidad:</strong> {detallesPedido.camisetas[productoIndex].cantidad}</p>
                                <p><strong>Talla:</strong> {detallesPedido.camisetas[productoIndex].talla}</p>
                            </article>
                        )}
                        </section>
                        <section className="navegacion-productos">
                            <button onClick={handleAnteriorProducto} disabled={productoIndex === 0}>Anterior</button>
                            <button onClick={handleSiguienteProducto} disabled={productoIndex === detallesPedido.camisetas.length - 1}>Siguiente</button>
                        </section>
                    </div>
                </section>
            )}
        </section>
    );
};

export default Carrito;
