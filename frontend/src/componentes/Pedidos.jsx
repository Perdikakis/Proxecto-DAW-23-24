import React, { useEffect, useState } from 'react';
import { ajaxAxios } from '../utils/ajaxAxios';
import '../css/Pedidos.css';

const Carrito = () => {
    const [pedidos, setPedidos] = useState([]);
    const [tipoPedidos, setTipoPedidos] = useState('activos');
    const pedidosActivos = pedidos.filter(pedido => !pedido.fecha_finalizado);
    const pedidosFinalizados = pedidos.filter(pedido => pedido.fecha_finalizado);

    useEffect(() => {
        ajaxAxios({
            url: `${import.meta.env.VITE_API_URL}/pedidos`,
            method: 'GET',
            fsuccess: (data) => {
                setPedidos(data.pedidos);
            },
            ferror: (error) => {
                console.error("Error al obtener pedidos", error);
            }
        });
    }, []);

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
                                        <td><a href="#">Ver detalles</a></td>
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
                                        <td><a href="#">Ver detalles</a></td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    ) : (
                        <p>No hay pedidos finalizados.</p>
                    )
                )}
            </article>
        </section>
    );
};

export default Carrito;
