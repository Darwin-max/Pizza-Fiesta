
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


CREATE TABLE combos (
id_combo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
descripcion TEXT,
precio DECIMAL(10,2) NOT NULL
);


CREATE TABLE combo_productos (
id_combo INT,
id_producto INT,
PRIMARY KEY (id_combo, id_producto),
FOREIGN KEY (id_combo) REFERENCES combos(id_combo),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
hora_recogida TIME NOT NULL,
fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
estado_pago ENUM('pendiente', 'pagado') DEFAULT 'pendiente',
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE TABLE detalle_pedido (
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
id_producto INT,
cantidad INT DEFAULT 1,
subtotal DECIMAL(10,2),
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

--  Ingredientes por cada pizza personalizada en un pedido, Posibilidad de añadir ingredientes extra


CREATE TABLE pizza_ingredientes (
id_detalle INT,
id_ingrediente INT,
PRIMARY KEY (id_detalle, id_ingrediente),
FOREIGN KEY (id_detalle) REFERENCES detalle_pedido(id_detalle),
FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);


CREATE TABLE pagos (
id_pago INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
monto_total DECIMAL(10,2),
metodo_pago ENUM('efectivo', 'tarjeta', 'transferencia'),
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);



