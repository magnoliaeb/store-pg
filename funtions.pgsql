aprender 
Amazon Cloud









-- creaca una funcionn que ume os numeros
CREATE OR REPLACE FUNCTION sumar (num1 INT, num2 INT)
    RETURNS INT 
AS

$$
    SELECT num1 + num2;
$$
    LANGUAGE SQL;

-- crea una funfion que  obteienne el salario de Magnolia '22626481'

CREATE OR REPLACE FUNCTION getSalaryEmp (cedula VARCHAR)
    RETURNS NUMERIC 
AS
$$
    SELECT
    e.salario
        FROM empleados AS e
        WHERE e.cedula = cedula
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION deleteCliente (cedula VARCHAR)
    RETURNS VOID 
AS
$$
    DELETE FROM clientes
        WHERE cedula = cedula
$$
LANGUAGE SQL;

