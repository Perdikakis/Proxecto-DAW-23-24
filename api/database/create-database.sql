DROP DATABASE IF EXISTS camikakis;
CREATE DATABASE camikakis;
USE camikakis;

-- Tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    rol VARCHAR(50),
    fecha_alta DATETIME,
    fecha_ultimo_acceso DATETIME
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    direccion VARCHAR(255),
    fecha_pedido DATETIME,
    fecha_envio DATETIME,
    fecha_finalizado DATETIME,
    estado VARCHAR(50),
    total DECIMAL(10, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabla de equipos
CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de competiciones
CREATE TABLE competiciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    localizacion VARCHAR(100),
    nombre VARCHAR(100) NOT NULL
);

-- Tabla intermedia entre equipos y competiciones (Muchos a Muchos)
CREATE TABLE equipo_competicion (
    equipo_id INT,
    competicion_id INT,
    PRIMARY KEY (equipo_id, competicion_id), -- Clave primaria compuesta
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON DELETE CASCADE,
    FOREIGN KEY (competicion_id) REFERENCES competiciones(id) ON DELETE CASCADE
);

-- Tabla de camisetas
CREATE TABLE camisetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT,
    year_inicio INT,
    year_fin INT,
    version VARCHAR(100),
    precio DECIMAL(10, 2),
    FOREIGN KEY (equipo_id) REFERENCES equipos(id)
);

-- Tabla de tallas
CREATE TABLE tallas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    talla VARCHAR(50) NOT NULL,
    medidas VARCHAR(100)
);

-- Tabla intermedia entre camisetas y tallas (Muchos a Muchos)
CREATE TABLE camiseta_talla (
    camiseta_id INT,
    talla_id INT,
    PRIMARY KEY (camiseta_id, talla_id), -- Clave primaria compuesta
    FOREIGN KEY (camiseta_id) REFERENCES camisetas(id) ON DELETE CASCADE,
    FOREIGN KEY (talla_id) REFERENCES tallas(id) ON DELETE CASCADE
);

-- Tabla intermedia entre pedidos, camisetas y tallas (Muchos a Muchos)
CREATE TABLE pedido_camiseta_talla (
    pedido_id INT,
    camiseta_id INT,
    talla_id INT,
    cantidad INT,
    PRIMARY KEY (pedido_id, camiseta_id, talla_id), -- Clave primaria compuesta
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (camiseta_id) REFERENCES camisetas(id) ON DELETE CASCADE,
    FOREIGN KEY (talla_id) REFERENCES tallas(id) ON DELETE CASCADE
);

CREATE TABLE tipos_imageable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
-- Insertar los tipos válidos
INSERT INTO tipos_imageable (nombre) VALUES ('equipo'), ('camiseta'), ('competicion'), ('usuario');


-- Tabla de imágenes (para relación polimórfica)
CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imageable_type_id INT NOT NULL,
    imageable_id INT NOT NULL,
    ruta VARCHAR(255),
    nombre_archivo VARCHAR(255),
    tipo_mime VARCHAR(100),
    FOREIGN KEY (imageable_type_id) REFERENCES tipos_imageable(id),
    INDEX (imageable_type_id, imageable_id)
);