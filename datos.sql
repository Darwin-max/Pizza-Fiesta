
CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
telefono VARCHAR(20),
direccion TEXT
);

CREATE TABLE productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
tipo ENUM('pizza', 'bebida') NOT NULL,
tamaño ENUM('pequeña', 'mediana', 'grande') NULL,
precio DECIMAL(10,2) NOT NULL
);


CREATE TABLE ingredientes (
id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio_adicional DECIMAL(10,2) DEFAULT 0.00
);


