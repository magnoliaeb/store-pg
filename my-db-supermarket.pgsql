-- nueva y mejor base de datos
DROP DATABASE supermarket;
CREATE DATABASE supermarket;

CREATE TABLE IF NOT EXISTS categorias
(
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS clientes
(
    cliente_id SERIAL PRIMARY KEY,
    cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80),
    sexo CHAR(1) NOT NULL DEFAULT 'M',
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    email VARCHAR(100),
    CONSTRAINT UQ_email_duplicate UNIQUE (email),
    CONSTRAINT CK_sexo_validate CHECK (sexo IN ('M', 'F')),
    CONSTRAINT UQ_cedula_duplicate UNIQUE (cedula)
);


CREATE TABLE IF NOT EXISTS cargos
(
    cargo_id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE IF NOT EXISTS empleados
(
    empleado_id SERIAL PRIMARY KEY,
    cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80),
    sexo CHAR(1) NOT NULL DEFAULT 'M',
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    email VARCHAR(100),
    salario NUMERIC(5, 2) NOT NULL DEFAULT 150.00,
    fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_nac DATE,
    cargo_id INTEGER REFERENCES cargos
    ON DELETE CASCADE ON UPDATE CASCADE,
    jefe_id INTEGER REFERENCES empleados
    ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CK_fecha_nac_validate CHECK (EXTRACT(YEAR FROM fecha_nac) > 1970),
    CONSTRAINT CK_fecha_ingreso_valide CHECK (fecha_ingreso > fecha_nac),
    CONSTRAINT CK_salario_validate CHECK (salario BETWEEN 100 AND 900),
    CONSTRAINT UQ_E_email_duplicate UNIQUE (email),
    CONSTRAINT CK_sexo_validate CHECK (sexo IN ('M', 'F')),
    CONSTRAINT UQ_E_cedula_duplicate UNIQUE (cedula)
);


CREATE TABLE IF NOT EXISTS facturas
(
    factura_id SERIAL PRIMARY KEY,
    codigo CHAR(5) NOT NULL,
    cliente_id INTEGER NOT NULL REFERENCES clientes
    ON DELETE RESTRICT ON UPDATE CASCADE,
    vendedor_id INTEGER NOT NULL REFERENCES empleados
    ON DELETE RESTRICT ON UPDATE CASCADE,
    fecha_emision DATE NOT NULL DEFAULT CURRENT_DATE,
    tipo CHAR(1) NOT NULL DEFAULT 'E',
    CONSTRAINT CK_tipo_validate CHECK (tipo IN ('E', 'R', 'A')),
    CONSTRAINT UQ_codigo_duplicate UNIQUE (codigo)
);

ALTER TABLE facturas
    ADD COLUMN estado BOOLEAN NOT NULL DEFAULT TRUE ;

ALTER TABLE productos
    RENAME COLUMN eistencia_min TO existencia_min ;

ALTER TABLE productos
    RENAME COLUMN eistencia_max TO existencia_max ;

CREATE TABLE IF NOT EXISTS productos
(
    producto_id SERIAL PRIMARY KEY,
    codigo CHAR(5) NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT,
    costo NUMERIC(5, 2) NOT NULL DEFAULT 0.00,
    precio NUMERIC(5, 2) DEFAULT 9.99,
    foto_url TEXT,
    descuento NUMERIC(3, 2) DEFAULT 0.10,
    tipo CHAR(1) NOT NULL DEFAULT 'N',
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    categoria_id INTEGER REFERENCES categorias
    ON DELETE RESTRICT ON UPDATE CASCADE,
    existencia SMALLINT NOT NULL DEFAULT 0,
    eistencia_min SMALLINT,
    eistencia_max SMALLINT,
    CONSTRAINT CK_eistencia_max_validate CHECK (eistencia_max > eistencia_min),
    CONSTRAINT CK_eistencia_min_validate CHECK (eistencia_min < eistencia_max),
    CONSTRAINT CK_tipo_validate CHECK (tipo IN ('N', 'I')),
    CONSTRAINT CK_precio_validate CHECK (precio > 0 AND precio > costo),
    CONSTRAINT CK_costo_validate CHECK (costo > 0 AND costo < precio),
    CONSTRAINT UQ_P_codigo_duplicate UNIQUE (codigo)
);


CREATE TABLE IF NOT EXISTS lista_articulos
(
    factura_id INTEGER REFERENCES facturas
    ON DELETE CASCADE ON UPDATE CASCADE,
    producto_id INTEGER REFERENCES productos
    ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (factura_id, producto_id),
    cantidad SMALLINT NOT NULL DEFAULT 1,
    CONSTRAINT CK_cantidad_validate CHECK (cantidad > 0)
);