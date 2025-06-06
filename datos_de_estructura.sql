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





-- 8. Consultar el detalle de un pedido (productos y sus ingredientes):

SELECT p.id_pedido, pr.nombre AS producto, pr.tipo, pr.tamaño, dp.cantidad,
       i.nombre AS ingrediente, i.precio_adicional
FROM pedidos p
JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
JOIN productos pr ON dp.id_producto = pr.id_producto
LEFT JOIN pizza_ingredientes pi ON dp.id_detalle = pi.id_detalle
LEFT JOIN ingredientes i ON pi.id_ingrediente = i.id_ingrediente
WHERE p.id_pedido = 1;





-- 9. Actualizar el precio de una pizza en el menú:

UPDATE productos
SET precio = 37000
WHERE id_producto = 2;
--10. Actualizar la dirección de un cliente:

UPDATE clientes
SET direccion = 'Calle 10 #12-34, Medellín'
WHERE id_cliente = 1;
-- 11. Eliminar un producto del menú (bebida):

DELETE FROM productos
WHERE id_producto = 5 AND tipo = 'bebida';
-- 12. Eliminar un ingrediente de la base de datos:

DELETE FROM ingredientes
WHERE id_ingrediente = 3;
-- 13. Consultar todos los pedidos de un cliente:

SELECT * FROM pedidos
WHERE id_cliente = 1;
--14. Listar todos los productos disponibles en el menú (pizzas y bebidas):

SELECT * FROM productos;
-- 15. Listar todos los ingredientes disponibles para personalizar una pizza:

SELECT * FROM ingredientes;
-- 16. Calcular el costo total de un pedido (incluyendo ingredientes adicionales):

SELECT 
    p.id_pedido,
    SUM(dp.subtotal + IFNULL(SUM(i.precio_adicional), 0)) AS total
FROM pedidos p
JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
LEFT JOIN pizza_ingredientes pi ON dp.id_detalle = pi.id_detalle
LEFT JOIN ingredientes i ON pi.id_ingrediente = i.id_ingrediente
WHERE p.id_pedido = 1
GROUP BY p.id_pedido;
--17. Listar los clientes que han hecho más de 5 pedidos:

SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente
HAVING total_pedidos > 5;
