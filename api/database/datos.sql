use camikakis;

-- Volcado de datos para la tabla `camisetas`
INSERT INTO `camisetas` (`id`, `equipo_id`, `year_inicio`, `year_fin`, `version`, `precio`) VALUES
(1, 1, 2020, 2021, 'Primera', 30.00),
(2, 2, 2021, 2022, 'Segunda', 35.00);

-- Volcado de datos para la tabla `camiseta_talla`
INSERT INTO `camiseta_talla` (`camiseta_id`, `talla_id`, `stock`) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 8),
(2, 4, 2);

-- Volcado de datos para la tabla `competiciones`
INSERT INTO `competiciones` (`id`, `localizacion`, `nombre`) VALUES
(1, 'España', 'La Liga'),
(2, 'Inglaterra', 'Premier League'),
(3, 'Alemania', 'Bundesliga'),
(4, 'Italia', 'Serie A');

-- Volcado de datos para la tabla `equipos`
INSERT INTO `equipos` (`id`, `nombre`) VALUES
(1, 'FC Barcelona'),
(2, 'Real Madrid'),
(3, 'Manchester United'),
(4, 'Bayern Munich'),
(5, 'Juventus');

-- Volcado de datos para la tabla `equipo_competicion`
INSERT INTO `equipo_competicion` (`equipo_id`, `competicion_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

-- Volcado de datos para la tabla `images`
INSERT INTO `images` (`id`, `imageable_type_id`, `imageable_id`, `ruta`, `nombre_archivo`, `tipo_mime`) VALUES
(1, 1, 1, '/images/equipo_a.jpg', 'equipo_a.jpg', 'image/jpeg'),
(2, 2, 1, '/images/camiseta_a.jpg', 'camiseta_a.jpg', 'image/jpeg'),
(3, 3, 1, '/images/competicion_a.jpg', 'competicion_a.jpg', 'image/jpeg'),
(4, 4, 1, '/images/usuario_juan.jpg', 'usuario_juan.jpg', 'image/jpeg');

-- Volcado de datos para la tabla `migrations`
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '000_create_sessions_table', 1);

-- Volcado de datos para la tabla `pedidos`
INSERT INTO `pedidos` (`id`, `usuario_id`, `direccion`, `fecha_pedido`, `fecha_envio`, `fecha_finalizado`, `estado`, `total`) VALUES
(1, 1, 'Calle Falsa 123', '2024-10-24 14:59:06', '2024-10-27 14:59:06', NULL, 'pendiente', 50.00),
(2, 2, 'Avenida Siempre Viva 456', '2024-10-24 14:59:06', '2024-10-29 14:59:06', NULL, 'pendiente', 75.00);

-- Volcado de datos para la tabla `pedido_camiseta_talla`
INSERT INTO `pedido_camiseta_talla` (`pedido_id`, `camiseta_id`, `talla_id`, `cantidad`, `dorsal`, `nombre_camiseta`) VALUES
(1, 1, 1, 2, 10, 'Nombre'),
(1, 2, 3, 1, 1, 'Portero'),
(2, 1, 2, 1, 17, 'Apellido');

-- Volcado de datos para la tabla `tallas`
INSERT INTO `tallas` (`id`, `talla`, `medidas`) VALUES
(1, 'S', '90-95 cm'),
(2, 'M', '95-100 cm'),
(3, 'L', '100-105 cm'),
(4, 'XL', '105-110 cm');

-- Volcado de datos para la tabla `tipos_imageable`
INSERT INTO `tipos_imageable` (`id`, `nombre`) VALUES
(2, 'camiseta'),
(3, 'competicion'),
(1, 'equipo'),
(4, 'usuario');

-- Volcado de datos para la tabla `usuarios`
INSERT INTO `usuarios` (`id`, `usuario`, `password`, `correo`, `nombre`, `apellidos`, `direccion`, `telefono`, `rol`, `fecha_alta`, `fecha_ultimo_acceso`) VALUES
(1, 'user1', '$2b$12$9ZdS.Ekv.WAlyXASwID/beALq8CWKNpEXEx4HzetcNeceXWvoW9sS', 'user1@example.com', 'Juan', 'Pérez', 'Calle Falsa 123', '123456789', 'cliente', '2024-10-24 14:58:58', '2024-10-24 14:58:58'),
(2, 'user2', '$2b$12$9ZdS.Ekv.WAlyXASwID/beALq8CWKNpEXEx4HzetcNeceXWvoW9sS', 'user2@example.com', 'Ana', 'García', 'Avenida Siempre Viva 456', '987654321', 'administrador', '2024-10-24 14:58:58', '2024-10-24 14:58:58');
