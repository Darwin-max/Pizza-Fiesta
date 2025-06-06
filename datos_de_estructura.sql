-- 1. **Registrar un nuevo cliente:**
INSERT INTO clientes (nombre ,telefono ,direccion ) 
    VALUES ('DARWIN', '3124060135', 'calle 45 #12-43' ),
    ('SANTIAGO', '3214745642', 'calle 98 #15-33' ),
    ('RONAL',   '3184545423', 'calle 43 #12-63' ),
    ('NICOLAS', '3124846888', 'calle 455 #152-73' ),
    ('SARA',    '3125454148', 'calle 27 #127-03' );



-- 2. **Agregar un nuevo producto (pizza) al menú:**

INSERT INTO productos ( nombre ,tipo, tamaño, precio ) 
VALUES  ('Pizza de la casa','pizza', 'mediana', 4500.00),
        ('Pizza mixta','pizza', 'pequeña', 4200.00),
        ('Pizza cuatro quesos','pizza', 'mediana', 4500.00),
        ('Pizza hawaiana','pizza', 'mediana', 4500.00),
        ('Pizza de pepperoni','pizza', 'mediana', 4500.00);

-- 3. **Registrar una bebida en el menú:**

INSERT INTO productos ( nombre ,tipo, tamaño, precio ) 
VALUES  ('PESSI','bebida', NULL, 5500.00),
        ('FANTA','bebida', NULL, 2200.00),
        ('COCA COLA','bebida', NULL, 4500.00),
        ('CERVESA','bebida', NULL, 3000.00),
        ('TE','bebida', NULL, 1500.00);



-- 4. **Agregar un ingrediente a la base de datos:**

INSERT INTO ingredientes (nombre, precio_adicional)
VALUES ('Champiñones', 3000 ),
       ('Tocineta', 6000 ),
       ('Extra queso', 2000 ),
       ('cebolla', 5000 ),
       ('Papas fritas ', 13000);

-- 5. **Crear un pedido para un cliente:**

INSERT INTO pedidos (id_cliente, hora_recogida, estado_pago)
VALUES (1, '09:32:00', 'pendiente');

