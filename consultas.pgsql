-- COMO HACER CONDICIONALES CON UNA COLUMNA CALCULADA
-- obtiene las categorias
SELECT
*
    FROM categorias AS c;

SELECT
c.categoria_id, c.nombre, c.estado
    FROM categorias AS c;

-- obtiene los productos
SELECT
p.codigo, p.nombre, p.precio, round(p.precio* 0.10, 2) AS descuento
    FROM productos p;

-- obtiene los datos del producto pepitona
SELECT
*
    FROM productos AS p
    WHERE p.nombre = 'Pepitona';

-- obtiene los datos de los productos que tienen un precio entre 200 y 400
SELECT
*
    FROM productos AS p
    WHERE p.precio BETWEEN 200 AND 400;

-- obtiene los datos de los productos que no tienen un precio entre 200 y 400
SELECT
*
    FROM productos AS p
    WHERE p.precio NOT BETWEEN 200 AND 400;

-- obtiene los datos de los productos que estan activo y son nacioales
SELECT
p.codigo, p.nombre, p.costo, p.precio, p.estado, p.tipo, p.existencia
    FROM productos AS p
    WHERE p.estado AND p.tipo = 'N';

-- obtiene los mpleados que tienen un salario entre 200 y 500 o los que no tienen correo
SELECT
e.cedula, concat(e.nombre,' ', e.apellido), e.salario, e.email
    FROM empleados AS e
    WHERE (e.salario BETWEEN 200 AND 500) OR e.email IS NULL;

-- obtiene la edad de los empleados
SELECT
e.cedula, e.nombre, e.apellido, e.sexo, EXTRACT(YEAR FROM age(e.fecha_nac))  AS edad
    FROM empleados AS e;


-- obteene las facturas de hoy
SELECT
*
    FROM facturas AS f
    WHERE f.fecha_emision = CURRENT_DATE;

-- actualiza la factura 12 y 17 a la fecha actual
UPDATE facturas
    SET fecha_emision = CURRENT_DATE
    WHERE factura_id IN (17, 12)
    RETURNING *;


-- Cuenta cuantos empleados estan trabajando
SELECT
 count(e.empleado_id)
    FROM empleados AS e
    WHERE e.estado = TRUE;

-- obtiene la edad minima de mis mis empleado
SELECT
 min(EXTRACT (YEAR FROM age(e.fecha_nac))) AS edad_min
    FROM empleados AS e;

-- obtiene las primeras 5 clientas de forma aleatoria
SELECT
*
    FROM clientes AS c
    WHERE c.sexo = 'F'
    ORDER BY random() LIMIT 5;

-- obtiene el sueldo promedio de los empleados mayores de edad
SELECT
    round(avg(e.salario), 2) AS salario_prom
    FROM empleados AS e
    WHERE EXTRACT(YEAR FROM age(e.fecha_nac)) > 18;

-- obtiene los empleados mayores de edad
SELECT
e.cedula, e.nombre, e.apellido, e.estado, e.fecha_nac,
EXTRACT(YEAR FROM age(e.fecha_nac)) AS edad
    FROM empleados AS e
    WHERE EXTRACT(YEAR FROM age(e.fecha_nac)) > 18;

-- obtiene los productos que su nombre inicie con G
SELECT
*
    FROM productos AS p
    WHERE p.nombre LIKE 'G%'
    ORDER BY p.nombre ASC;

-- obtiene los clientes y los ordena por nombre y apellido
SELECT
*
    FROM clientes AS p
    ORDER BY p.nombre, p.apellido;

-- obtiene el ultimo empleado registrado
SELECT
*
    FROM empleados AS e
    ORDER BY e.empleado_id DESC
    LIMIT 1;

-- obtiene los clientes que no tiene email
SELECT
*
    FROM clientes AS c
    WHERE c.email IS NULL
    ORDER BY c.nombre ASC, c.apellido;

-- obtiene el precio mayor de los productos
SELECT 
max(p.precio) 
    FROM productos AS p;

-- obtiene las facturas del mes actual
SELECT
f.*, EXTRACT(YEAR FROM f.fecha_emision) AS year_date, EXTRACT(MONTH FROM f.fecha_emision) AS month_date
    FROM facturas AS f
    WHERE EXTRACT(YEAR FROM f.fecha_emision) = EXTRACT(YEAR FROM CURRENT_DATE) AND 
    EXTRACT(MONTH FROM f.fecha_emision) = EXTRACT(MONTH FROM CURRENT_DATE);

-- obtiene cuantas facturas hay por cada año
SELECT
EXTRACT(YEAR FROM f.fecha_emision) AS year_date, count(f.codigo)
    FROM facturas AS f
    GROUP BY year_date;

-- obtiene los productos con sus categorias
SELECT
p.codigo, p.nombre, p.costo, p.precio, p.estado, p.tipo, c.nombre
    FROM categorias AS c
    JOIN productos AS p ON (c.categoria_id = p.categoria_id);

-- obtiene los productos que son vegetales
SELECT
p.codigo, p.nombre, p.costo, p.precio, p.estado, p.tipo, c.nombre
    FROM categorias AS c
    JOIN productos AS p ON (c.categoria_id = p.categoria_id)
    WHERE c.nombre = 'Vegetal';

-- acualiza a null el campo de la categoria_id a todos los productos
UPDATE productos
    SET categoria_id = NULL;

-- agrupa los prductos por categoria
SELECT
p.codigo, p.nombre, p.precio, c.nombre
    FROM categorias AS c
    RIGHT JOIN productos AS p ON (c.categoria_id = p.categoria_id)
    ORDER BY p.nombre ASC;

DELETE FROM categorias
    WHERE categoria_id = 9
    RETURNING *;

-- obtiene cuanto cuenta el producto mas caro de cada categoria
SELECT
c.nombre, max(p.precio)
    FROM categorias AS c
    JOIN productos AS p ON (c.categoria_id = p.categoria_id)
    GROUP BY c.nombre;

-- seleccina las categorias cuyos productos pasen el precio promedio
SELECT
c.nombre, round(avg(p.precio), 2)
    FROM categorias AS c
    JOIN productos AS p ON (c.categoria_id = p.categoria_id)
    GROUP BY c.nombre
    HAVING avg(p.precio) > 500;


-- obteiene el producto mas costoso
SELECT
*
    FROM productos AS p
    WHERE p.precio = (
        SELECT max(p.precio) FROM productos AS p
    );

-- obtiene los productos que son de categoria Carne y medicamento
SELECT
*
    FROM productos AS p
    WHERE p.categoria_id IN (SELECT c.categoria_id
        FROM categorias AS c
        WHERE c.nombre IN ('Carne', 'Medicamento'));


-- obteiene las facturas realizadas por los empleados
SELECT
f.*, e.nombre, e.cedula
    FROM empleados AS e
    JOIN facturas AS f ON (e.empleado_id = f.vendedor_id);


-- obtiene las facturas realizadas por Dayna con cedula = 18273563
SELECT
f.*
    FROM empleados AS e
    JOIN facturas AS f ON (e.empleado_id = f.vendedor_id)
    WHERE e.cedula = '18273563';

-- obtiene cuantas facturas realizo cada empleado
SELECT
e.cedula, count(f.codigo)
    FROM empleados AS e
    JOIN facturas AS f ON (e.empleado_id = f.vendedor_id)
    GROUP BY e.cedula;

-- obtiene los productos que tiene la factura FAC09
SELECT
p.codigo, p.nombre, p.precio
    FROM lista_articulos AS l_a
    JOIN productos AS p ON (l_a.producto_id = p.producto_id)
    WHERE l_a.factura_id = (
        SELECT
        f.factura_id
            FROM facturas AS f
            WHERE f.codigo = 'FAC09'
    );

-- obtiene cuantas facturas tiene el cliente 12234198
SELECT
count(f.codigo)
    FROM clientes AS c
    JOIN facturas AS f ON (c.cliente_id = f.cliente_id)
    WHERE c.cedula = '12234198';

-- obtiene el detalle de la factura 'FAC18'
SELECT
p.codigo, p.nombre, l_a.cantidad, p.precio, p.precio* l_a.cantidad AS total
    FROM productos AS p
    JOIN lista_articulos AS l_a ON (p.producto_id = l_a.producto_id)
    WHERE l_a.factura_id = (
        SELECT
        f.factura_id
            FROM facturas AS f
            WHERE f.codigo = 'FAC18'
    );


-- obtiene la suma de la venta de la factura 'FAC18'
SELECT
round(sum( p.precio* l_a.cantidad), 2) AS total
    FROM productos AS p
    JOIN lista_articulos AS l_a ON (p.producto_id = l_a.producto_id)
    WHERE l_a.factura_id = (
        SELECT
        f.factura_id
            FROM facturas AS f
            WHERE f.codigo = 'FAC18'
    );

-- obtiene las facturas que tiene los productos PRO03, PPRO10, PRO18
SELECT
f.*
    FROM facturas AS f
    JOIN lista_articulos AS l_a ON (f.factura_id = l_a.factura_id)
    WHERE l_a.producto_id IN (
        SELECT
        p.producto_id
            FROM productos AS p
            WHERE p.codigo IN ('PRO03', 'PRO10', 'PRO18')
    );

-- obtiene las personas registradas
SELECT
c.cliente_id, c.cedula, c.nombre, c.apellido, c.email
    FROM clientes AS c
UNION ALL
SELECT
e.empleado_id, e.cedula, e.nombre, e.apellido, e.email
    FROM empleados AS e;

-- inserta un nuevo empleado
INSERT INTO empleados
(
    cedula,
    nombre,
    apellido,
    email,
    sexo,
    cargo_id,
    fecha_ingreso,
    salario,
    fecha_nac
) VALUES
    (
        '22626481',
        'Magnolia',
        'Benjamin',
        'magno@gmail.com',
        'F',
        2,
        'Sat Dec 14 2018',
        450.34,
        'Sat Dec 14 1993'
    );

-- obtiene los productos que estan por debajo del stoc
SELECT
*
    FROM productos AS p
    WHERE p.existencia < p.existencia_min;




