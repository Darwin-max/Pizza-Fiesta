-- 1. **Registrar un nuevo cliente:**
INSERT INTO clientes (nombre ,telefono ,direccion ) 
    VALUES ('DARWIN', '3124060135', 'calle 45 #12-43' ),
    ('SANTIAGO', '3214745642', 'calle 98 #15-33' ),
    ('RONAL',   '3184545423', 'calle 43 #12-63' )
    ('NICOLAS', '3124846888', 'calle 455 #152-73' )
    ('SARA',    '3125454148', 'calle 27 #127-03' )



2. **Agregar un nuevo producto (pizza) al menú:**

INSERT INTO productos ( nombre ,tipo, tamaño, precio ) 
VALUES  ('Pizza de la casa','pizza', 'mediana', 4500.00),
        ('Pizza mixta','pizza', 'pequeña', 4200.00),
        ('Pizza cuatro quesos','pizza', 'mediana', 4500.00),
        ('Pizza hawaiana','pizza', 'mediana', 4500.00),
        ('Pizza de pepperoni','pizza', 'mediana', 4500.00)