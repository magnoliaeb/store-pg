-- obtine el total de las ventas
SELECT
sum(p.precio*l_a.cantidad)
    FROM lista_articulos AS l_a
    JOIN productos AS p ON (l_a.producto_id = p.producto_id);

-- obtiene las facturas y el total de cada venta
SELECT
*, (
    SELECT
    sum(p.precio*l_a.cantidad)
        FROM lista_articulos AS l_a
        JOIN productos AS p ON (l_a.producto_id = p.producto_id)
        WHERE l_a.factura_id = f.factura_id
        GROUP BY l_a.factura_id 
) AS total
    FROM facturas AS f;


-- crea una vista de las facturas y el total de cada venta
CREATE OR REPLACE VIEW view_facturas_total AS
(
    SELECT
    *, (
        SELECT
        sum(p.precio*l_a.cantidad)
            FROM lista_articulos AS l_a
            JOIN productos AS p ON (l_a.producto_id = p.producto_id)
            WHERE l_a.factura_id = f.factura_id
            GROUP BY l_a.factura_id 
    ) AS total
        FROM facturas AS f
) WITH CHECK OPTION;

-- obtine cuantas ventas se realizaron al mes dle año actual
SELECT
EXTRACT(MONTH FROM f.fecha_emision), count(f.factura_id)
    FROM facturas AS f
    WHERE f.fecha_emision BETWEEN '2020-01-01' AND CURRENT_DATE
    GROUP BY EXTRACT(MONTH FROM f.fecha_emision);

-- obtiene el top  10  de los productos mas vedidos
SELECT
p.codigo, p.nombre, p.precio, p.existencia, p.costo, (
    SELECT
        count(l_a.producto_id) AS cantidad
            FROM lista_articulos AS l_a
            WHERE l_a.producto_id = p.producto_id
            GROUP BY l_a.producto_id
            ORDER BY cantidad DESC
            LIMIT 10
) AS cantidad
    FROM productos AS p
    WHERE p.producto_id IN (
        SELECT producto_id FROM (
            SELECT
        l_a.producto_id, count(l_a.producto_id) AS cantidad
            FROM lista_articulos AS l_a
            GROUP BY l_a.producto_id
            ORDER BY cantidad DESC
            LIMIT 10
        ) AS top_productos
    );


-- obtiene que productos no se venden
SELECT
p.codigo, p.nombre, p.precio, p.producto_id
    FROM productos AS p
    LEFT JOIN lista_articulos AS l_a ON (p.producto_id = l_a.producto_id)
	WHERE l_a.producto_id IS NULL;

-- obtiene los clientes que son mujeres y tienen correos y que tienen una compra al mes de 4400$

-- obtiene las facturas que tiene el productos mas costoso y el vas economico
SELECT
f.*
    FROM facturas AS f
    JOIN lista_articulos AS l_a ON (f.factura_id = l_a.factura_id)
    WHERE l_a.producto_id = (
        SELECT
        p.producto_id
            FROM productos AS p
            WHERE p.precio = (
                SELECT 
                max(p.precio) 
                    FROM productos AS p
            )
    );

SELECT
f.*
    FROM facturas AS f
    JOIN lista_articulos AS l_a ON (f.factura_id = l_a.factura_id)
    WHERE l_a.producto_id = (
        SELECT
        p.producto_id
            FROM productos AS p
            WHERE p.precio = (
                SELECT 
                min(p.precio) 
                    FROM productos AS p
            )
    );

-- verifica que la factura FAC21 tiene el producto mas costoso
SELECT
p.*
    FROM facturas AS f
    JOIN lista_articulos AS l_a ON (f.factura_id = l_a.factura_id)
    JOIN productos AS p ON (p.producto_id = l_a.producto_id)
    WHERE f.codigo = 'FAC21';
    

-- obteien el valor promedio de las ventas
SELECT
 round(avg(f_t.total))
    FROM view_facturas_total AS f_t;


-- obtiene las facturas por clientes
SELECT
f.codigo, f.fecha_emision, f.estado, f.tipo, c.cedula, concat(c.nombre, ' ', c.apellido)
    FROM clientes AS c
    JOIN facturas AS f ON (c.cliente_id = f.cliente_id);

-- obtiene los empleados que han realizado ventas mayores 5500 $;

-- elimina las funciones
DROP FUNCTION searchproductbycode, getsalaryemp, deletecliente;

-- busca el producto por codigo
CREATE OR REPLACE FUNCTION searchProductByCode (code CHAR)
    RETURNS productos 
AS
$$
    SELECT
    p.*
        FROM productos AS p
        WHERE p.codigo = $1;
$$ LANGUAGE SQL;

SELECT * FROM searchproductbycode('PRO10');

-- busca el producto mas costoso
CREATE OR REPLACE FUNCTION searchProductExpensive ()
    RETURNS productos
AS
$$
    SELECT
    *
        FROM productos AS p
        WHERE p.precio = (
            SELECT
            max(p.precio)
                FROM productos AS p
        );
$$ LANGUAGE SQL;

SELECT
*
    FROM searchProductExpensive();


CREATE OR REPLACE FUNCTION getSalaryByDni (dni VARCHAR)
    RETURNS TABLE (cedula VARCHAR, nombre VARCHAR, apellido VARCHAR, sexo CHAR, email VARCHAR, fecha_ingreso DATE, salario NUMERIC)
AS
$$
    BEGIN
        RETURN QUERY SELECT
        e.cedula, e.nombre, e.apellido, e.sexo, e.email, e.fecha_ingreso, 
        CASE
            WHEN  EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM e.fecha_ingreso) > 5 THEN e.salario + (e.salario*0.40)
            ELSE e.salario
        END AS salario
        FROM empleados AS e
            WHERE e.cedula = $1;
    END
$$ LANGUAGE plpgsql;

SELECT
*
    FROM getSalaryByDni('22626481');

-- CREATE OR REPLACE FUNCTION getSalaryByDni (cedula VARCHAR)
--     RETURNS empleados(cedula VARCHAR, nombre VARCHAR, apellido VARCHAR, sexo CHAR, email VARCHAR, fecha_ingreso DATE, salario NUMERIC)
-- AS
-- $$
--     SELECT
--     e.cedula, e.nombre, e.apellido, e.sexo, e.email, e.fecha_ingreso, 
--     CASE
--         WHEN  EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM e.fecha_ingreso) > 5 THEN e.salario + (e.salario*0.40)
--         ELSE e.salario
--     END AS salario
--     FROM empleados AS e
--         WHERE e.cedula = $1;
-- $$ LANGUAGE SQL;
