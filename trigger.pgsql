CREATE TABLE IF NOT EXISTS log_empleados
(
    empleado_id INTEGER,
    nombre VARCHAR(80) NOT NULL,
    salario NUMERIC(5, 2) NOT NULL,
    usuario VARCHAR(80) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL
);

DROP TABLE log_empleados; 


CREATE OR REPLACE FUNCTION SP_TR_insert ()
    RETURNS TRIGGER 
AS
$$
    DECLARE
        usuario VARCHAR := USER;
        fecha DATE := CURRENT_DATE;
        hora TIME := CURRENT_TIME;
    BEGIN
        INSERT INTO log_empleados
            VALUES
                (NEW.empleado_id, NEW.nombre, NEW.salario, usuario, fecha, hora);
        
        RETURN NEW;

    END
$$
LANGUAGE PLPGSQL

CREATE TRIGGER TR_insert AFTER INSERT ON empleados
FOR EACH ROW
EXECUTE PROCEDURE SP_TR_insert();



INSERT INTO empleados
(
    cedula, nombre, apellido, email, cargo_id, fecha_ingreso, fecha_nac, estado, salario, sexo
) VALUES
    ('18903789', 'Angel', 'Cubero', NULL, 2, 'Thu Jun 04 2020', 'Sat Feb 01 1996', DEFAULT, DEFAULT, 'M');

SELECT
e
    FROM log_empleados AS e;





CREATE OR REPLACE FUNCTION updateSalario ()
    RETURNS TRIGGER 
AS
$$
    BEGIN
        INSERT INTO change_empleados
        (
            empleado_id, nombre, salario
        )
        VALUES 
            (OLD.empleado_id, OLD.nombre, OLD.salario);
        
        RETURN NEW;
    END
$$
LANGUAGE PLPGSQL;


-- que lo actives antes de hacer el update
CREATE TRIGGER TR_update_salario BEFORE UPDATE ON empleados
    FOR EACH ROW
    EXECUTE PROCEDURE updateSalario();


CREATE OR REPLACE FUNCTION name_funtion (params type)
    RETURNS type 
AS
$$
    DECLARE
        nombre VARCHAR := 'magnolia';
        numero INT := 3;
    BEGIN
        IF (numero > 0) THEN
            RAISE NOTICE 'Es positivo: %', numero;
        ELSE
            RAISE NOTICE 'Es negativo: %', numero;
        END IF
    END
$$
LANGUAGE PL/PGSQL



