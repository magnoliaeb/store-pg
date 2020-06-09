CREATE SEQUENCE SQ_name
    START WITH 1,
    INCREMENT BY 2,
    MINVALUE 1,
    MAXVALUE 100;

DROP SEQUENCE SQ_name;

ALTER SEQUENCE sq_name;

CREATE OR REPLACE FUNCTION searchProductByCode (codeProduct INT)
    RETURNS VARCHAR 
AS
$$
    SELECT p FROM productos AS p
        WHERE p.codigo = codeProduct
$$
    LANGUAGE SQL;


