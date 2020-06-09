INSERT INTO categorias
(
    nombre, 
    descripcion, 
    estado
) VALUES
    (
        'Fruta',
        NULL,
        FALSE
    )  RETURNING *;

INSERT INTO categorias
(
    nombre,
    estado
) VALUES
    (
        'Medicamento',
        TRUE
    ),
    (
        'Bebida',
        FALSE
    ),
    (
        'Carne',
        DEFAULT
    ),
    (
        'Vegetal',
        DEFAULT
    ),
    (
        'Grano',
        FALSE
    ),
    (
        'Chocolate',
        DEFAULT
    ),
    (
        'Dulce',
        FALSE
    ),
    (
        'Carne',
        DEFAULT
    );


INSERT INTO cargos
(
    nombre,
    descripcion,
    estado
) VALUES
    (
        'Gerente general',
        'Presidente de la empresa',
        DEFAULT
    )  RETURNING *;


INSERT INTO  cargos
(
    nombre,
    estado
) VALUES
    (
        'Secretaria',
        DEFAULT
    ),
    (
        'Vendedor',
        FALSE
    ),
    (
        'Administrador',
        DEFAULT
    );


INSERT INTO clientes
(
    cedula,
    nombre,
    apellido,
    sexo,
    estado,
    email
) VALUES
    (
        '22626481',
        'Magnolia',
        'Benjamin',
        'F',
        FALSE,
        'magno@gmail.com'
    ),
    (
        '17890456',
        'Karina',
        'Garcia',
        'F',
        DEFAULT,
        NULL
    )  RETURNING *;

INSERT INTO clientes
(
    nombre,
    apellido,
    email,
    sexo,
    cedula,
    estado
) VALUES
    (
        'Raymundo',
        'Reichert',
        'raymundo11@hotmail.com',
        'M',
        '12356389',
        false
    ),
    (
        'Brooks',
        'Bogan',
        'brooks20@gmail.com',
        'F',
        '16723908',
        false
    ),
    (
        'Florence',
        'Swaniawski',
        'florence.larkin75@gmail.com',
        'F',
        '15243671',
        true
    ),
    (
        'Dandre',
        'Kovacek',
        'dandrey85@hotmail.com',
        'M',
        '18786240',
        true
    ),
    (
        'Barry',
        'Beer',
        'barry_beer@hotmail.com',
        'M',
        '16231167',
        false
    ),
    (
        'Darrel',
        'Pagac',
        'darrel.weissnat@hotmail.com',
        'M',
        '12234198',
        true
    ),
    (
        'Sheila',
        'Sipes',
        'sheila.sipes67@yahoo.com',
        'F',
        '21267975',
        true
    ),
    (
        'Javier',
        'Bartoletti',
        'javier95@yahoo.com',
        'M',
        '23456576',
        false
    ),
    (
        'Delbert',
        'Casper',
        NULL,
        'M',
        '25635467',
        DEFAULT
    ),
    (
        'Lily', 
        'Rolfson', 
        'lily.Gleason@gmail.com', 
        'F', 
        '12890456',
         DEFAULT
    ),
    (
        'Vicenta',
        'Donnelly',
        'vicenta@hotmail.com',
        'F',
        '25378465',
        FALSE
    ),
    (
        'Dane',
        'Denesik',
        'dane@gmail.com',
        'M',
        '34287563',
        DEFAULT
    ),
    (
        'Sarina',
        'Glover',
        'sarina@yahoo.com',
        'F',
        '36784673',
        FALSE
    ),
    (
        'Granville',
        'Dach',
        'granville@hotmail.com',
        'M',
        '23456123',
        DEFAULT
    ),
    (
        'Ana',
        NULL,
        NULL,
        'F',
        '23456789',
        FALSE
    ),
    (
        'Pedro',
        'Garcia',
        'pedro@gmail.com',
        'M',
        '12678354',
        DEFAULT
    ),
    (
        'Kevin',
        'Benjamin',
        'kevin@gmail.com',
        'M',
        '24567890',
        FALSE
    );


INSERT INTO empleados
(
    cedula,
    nombre,
    apellido,
    sexo,
    estado,
    email,
    salario,
    fecha_ingreso,
    fecha_nac,
    cargo_id,
    jefe_id
) VALUES
    (
        '17746678',
        'Jose',
        'Velasquez',
        'M',
        DEFAULT,
        'jose_34@hotmail.com',
        400,
        'Fri May 29 2020',
        'Sun Dec 29 1998',
        2,
        NULL
    ),
    (
        '18987678',
        'Marco',
        'Rondon',
        'M',
        DEFAULT,
        'marco_12.r@hotmail.com',
        100,
        'Fri May 19 2020',
        'Sun Jan 19 1999',
        2,
        NULL
    ) RETURNING *;


INSERT INTO empleados
(
    nombre,
    apellido,
    email,
    sexo,
    estado,
    cedula,
    salario,
    fecha_nac,
    fecha_ingreso,
    cargo_id
) VALUES
    (
        'Carole',
        'Abbott',
        'carole30@yahoo.com',
        'F',
        false,
        '12345765',
        665.69,
        'Sun Mar 15 2002',
        'Sun May 24 2020',
        1
    ),
    (
        'Rafaela',
        'Kassulke',
        'rafaela_kassulke61@hotmail.com',
        'F',
        false,
        '18765435',
        565.17,
        'Fri Dec 20 2009',
        'Mon May 25 2020',
        2
    ),
    (
        'Eliseo',
        'Brown',
        'eliseo84@gmail.com',
        'M',
        true,
        '17678902',
        507.68,
        'Thu Sep 05 1999',
        'Mon May 25 2020',
        2
    ),
    (
        'Marquise',
        'Mueller',
        NULL,
        'M',
        true,
        '18273234',
        409.07,
        'Wed Dec 11 1989',
        'Mon May 25 2010',
        1
    ),
    (
        'Baylee',
        'Krajcik',
        'krajcik.little@hotmail.com',
        'M',
        true,
        '18928367',
        297.68,
        'Thu Oct 17 2000',
        'Sun May 24 2020',
        2
    ),
    (
        'Lelia',
        'Durgan',
        'lelia_cronin@hotmail.com',
        'F',
        false,
        '19890782',
        631.02,
        'Mon May 04 1998',
        'Mon May 25 2017',
        2
    ),
    (
        'Burley',
        'Jerde',
        NULL,
        'F',
        true,
        '17827456',
        192.16,
        'Sun Dec 15 2002',
        'Mon May 25 2020',
        3
    ),
    (
        'Margaretta',
        'Pacocha',
        'margaretta.pacocha45@yahoo.com',
        'F',
        false,
        '17827302',
        113.21,
        'Tue Mar 31 2000',
        'Mon May 25 2020',
        1
    ),
    (
        'Walter',
        'Friesen',
        'walter@hotmail.com',
        'F',
        false,
        '19023785',
        668.71,
        'Thu Apr 30 1997',
        'Mon May 25 2020',
        1
    ),
    (
        'Stefan',
        'Gibson',
        NULL,
        'M',
        true,
        '16235467',
        555.04,
        'Fri Jun 07 1987',
        'Sun May 24 2010',
        1
    ),
    (
        'Nikolaus',
        'Schoen',
        'nikolaus@hotmail.com',
        'F',
        false,
        '25234178',
        184.96,
        'Tue May 28 2009',
        'Mon Feb 25 2020',
        3
    ),
    (
        'Johnny',
        'Lang',
        'johnny_hand88@gmail.com',
        'M',
        true,
        '22352888',
        630.96,
        'Sat May 09 1989',
        'Mon May 25 2008',
        2
    ),
    (
        'Rudy',
        'Pfeffer',
        'rudy@yahoo.com',
        'F',
        true,
        '18928365',
        536.66,
        'Fri Sep 13 2009',
        'Mon Jan 25 2020',
        1
    ),
    (
        'Dayna',
        'Erdman',
        NULL,
        'F',
        true,
        '18273563',
        243.33,
        'Tue Jun 18 1995',
        'Mon Feb 25 2020',
        3
    ),
    (
        'Terry',
        'Oberbrunner',
        NULL,
        'M',
        true,
        '27653892',
        676.52,
        'Sun Aug 18 2000',
        'Mon May 25 2020',
        2
    ),
    (
        'Maria',
        'Perez',
        NULL,
        'F',
        TRUE,
        '32352676',
        DEFAULT,
        '1985-02-23',
        '2001-10-21',
        2
    ),
	(
        'Juan', 
        'Lopez',
        'juan@gmail.com',
        'M',
        FALSE,
        '18924378',
        253.45,
        '1993-04-12',
        '2004-09-18',
        1
    ),
	(
        'Pedro',
        'Gomez',
        NULL,
        'M',
        TRUE,
        '16263782',
        DEFAULT,
        '1999-03-26',
        '2010-02-12',
        2
    ),
    (
        'Wallace', 
        'Kohler', 
        'wallace@yahoo.com', 
        'F',
        DEFAULT,
        '17823890',
        456.00,
        '1996-06-23',
        '2018-07-12',
        1
    ),
    (
        'Kirsten', 
        'Runolfsson', 
        'kirsten@hotmail.com', 
        'F',
        FALSE,
        '152783123',
        289.00, 
        '2000-01-01',
        '2018-09-12',
        1
    ),
    (
        'Carmela',
        'Mertz',
        'carmela@yahoo.com',
        'F',
        DEFAULT,
        '17827345',
        393.00, 
        '2001-02-12',
        '2020-04-14',
        3
    ),
    (
        'Ana',
        NULL,
        NULL,
        'F',
        FALSE,
        '23456789',
        456.35,
        '2001-02-12',
        '2020-04-14',
        2
    );


INSERT INTO facturas
(
    codigo,
    cliente_id,
    vendedor_id,
    fecha_emision,
    tipo
) VALUES
    (
        'FAC01',
        3,
        (SELECT
            e.empleado_id
                FROM empleados AS e
                JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                WHERE c.nombre = 'Vendedor'
                ORDER BY random() LIMIT 1),
        'May 30 2020',
        'A'
    ),
    (
        'FAC02',
        3,
        (SELECT
            e.empleado_id
                FROM empleados AS e
                JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                WHERE c.nombre = 'Vendedor'
                ORDER BY random() LIMIT 1),
        'May 30 2020',
        'E'
    ) RETURNING *;




INSERT INTO facturas
    (codigo, cliente_id, vendedor_id, fecha_emision, tipo, estado)
    VALUES
        (
            'FAC31',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Fri Oct 04 2019 00:41:39'),
            ('A'),
            false
        ),
        (
            'FAC32',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Tue Feb 04 2020 05:25:19'),
            ('R'),
            true
        ),
        (
            'FAC03',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Fri Feb 07 2020 03:45:13'),
            ('A'),
            false
        ),
        (
            'FAC04',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Aug 15 2019 17:28:30'),
            ('A'),
            false
        ),
        (
            'FAC05',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon May 11 2020 12:06:50'),
            ('A'),
            false
        ),
        (
            'FAC06',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu May 14 2020 03:34:40'),
            ('A'),
            true
        ),
        (
            'FAC07',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Tue Jul 09 2019 15:34:23'),
            ('A'),
            true
        ),
        (
            'FAC08',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Fri Sep 20 2019 01:01:39'),
            ('A'),
            false
        ),
        (
            'FAC09',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Oct 24 2019 16:56:21'),
            ('A'),
            true
        ),
        (
            'FAC10',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Fri May 08 2020 15:37:42'),
            ('R'),
            true
        ),
        (
            'FAC11',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Sat Oct 19 2019 20:07:05'),
            ('A'),
            true
        ),
        (
            'FAC12',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Sun Oct 06 2019 17:26:49'),
            ('A'),
            false
        ),
        (
            'FAC13',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Jul 25 2019 10:18:06'),
            ('A'),
            false
        ),
        (
            'FAC14',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Sat Nov 09 2019 15:28:15'),
            ('A'),
            false
        ),
        (
            'FAC15',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon Sep 09 2019 18:16:22'),
            ('A'),
            true
        ),
        (
            'FAC16',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon Sep 30 2019 10:00:56'),
            ('R'),
            false
        ),
        (
            'FAC17',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Wed Sep 25 2019 07:54:12'),
            ('R'),
            true
        ),
        (
            'FAC18',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon Mar 16 2020 03:50:13'),
            ('A'),
            true
        ),
        (
            'FAC19',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Sat Dec 21 2019 17:18:06'),
            ('E'),
            false
        ),
        (
            'FAC20',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Dec 19 2019 15:15:23'),
            ('E'),
            false
        ),
        (
            'FAC21',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Nov 21 2019 11:36:11'),
            ('A'),
            false
        ),
        (
            'FAC22',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Sun Feb 23 2020 00:56:20'),
            ('A'),
            true
        ),
        (
            'FAC23',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Aug 08 2019 21:07:05'),
            ('A'),
            false
        ),
        (
            'FAC24',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon Jan 20 2020 11:29:42'),
            ('A'),
            false
        ),
        (
            'FAC25',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Thu Dec 12 2019 22:56:41'),
            ('E'),
            true
        ),
        (
            'FAC26',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Tue Nov 26 2019 07:20:19'),
            ('E'),
            false
        ),
        (
            'FAC27',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon Mar 23 2020 20:42:48'),
            ('A'),
            true
        ),
        (
            'FAC28',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Sun Dec 29 2019 15:58:18'),
            ('A'),
            true
        ),
        (
            'FAC29',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Wed Jul 24 2019 10:09:12'),
            ('A'),
            true
        ),
        (
            'FAC30',
            (SELECT
                c.cliente_id
                    FROM clientes AS c
                    WHERE c.cliente_id NOT IN (3,7,9,10)
                    ORDER BY random() LIMIT 1),
            (SELECT
                e.empleado_id
                    FROM empleados AS e
                    JOIN cargos AS c ON (e.cargo_id = c.cargo_id)
                    WHERE c.nombre = 'Vendedor' AND e.empleado_id NOT IN (18,22)
                    ORDER BY random() LIMIT 1),
            ('Mon Jun 03 2019 01:28:06'),
            ('A'),
            false
        );


INSERT INTO productos
(
    codigo,
    nombre,
    costo,
    precio,
    descuento,
    tipo,
    estado,
    categoria_id,
    existencia,
    existencia_min,
    existencia_max
) VALUES
    (
        'PRO01',
        'Repollo morado',
        367.34,
        890.23,
        0.20,
        'N',
        DEFAULT,
        5,
        12,
        5,
        24
    )  RETURNING *;





INSERT INTO productos
(
    codigo,
    nombre,
    costo,
    precio,
    estado,
    tipo,
    categoria_id,
    existencia,
    existencia_min,
    existencia_max,
    descuento
)   VALUES
    (
        'PRO24',
        'Pollo',
        700,
        751,
        true,
        'N',
        3,
        3,
        27,
        94,
        0.47
    ),
    (
        'PRO02',
        'Acetaminofen',
        87,
        166,
        true,
        'N',
        1,
        66,
        14,
        29,
        0.86
    ),
    (
        'PRO03',
        'Sardina',
        290,
        337,
        false,
        'N',
        8,
        19,
        11,
        20,
        0.66
    ),
    (
        'PRO04',
        'Cocacola',
        687,
        929,
        true,
        'N',
        2,
        14,
        30,
        80,
        0.9
    ),
    (
        'PRO05',
        'Agua mineral',
        311,
        566,
        true,
        'N',
        2,
        99,
        04,
        10,
        0.28
    ),
    (
        'PRO06',
        'Pepitona',
        376,
        456,
        false,
        'N',
        8,
        56,
        26,
        78,
        0.49
    ),
    (
        'PRO07',
        'Ibuprofeno',
        364,
        482,
        false,
        'N',
        1,
        14,
        51,
        79,
        0.47
    ),
    (
        'PRO08',
        'Gatorade',
        647,
        883,
        true,
        'N',
        2,
        29,
        20,
        33,
        0.77
    ),
    (
        'PRO09',
        'Pepito',
        357,
        471,
        true,
        'N',
        7,
        61,
        31,
        46,
        0.10
    ),
    (
        'PRO10',
        'Jugo de pera',
        114,
        277,
        false,
        'N',
        2,
        65,
        14,
        42,
        0.12
    ),
    (
        'PRO11',
        'Aji dulce',
        692,
        968,
        true,
        'I',
        4,
        47,
        18,
        21,
        0.98
    ),
    (
        'PRO12',
        'Caraotas negras',
        99,
        199,
        true,
        'I',
        4,
        3,
        288,
        310,
        0.12
    ),
    (
        'PRO13',
        'Lentejas verdes',
        345,
        414,
        true,
        'N',
        4,
        11,
        5,
        36,
        0.22
    ),
    (
        'PRO14',
        'Carne molidad',
        555,
        761,
        false,
        'N',
        3,
        38,
        9,
        34,
        0.12
    ),
    (
        'PRO15',
        'Miovit',
        549,
        862,
        true,
        'N',
        1,
        31,
        20,
        37,
        0.50
    ),
    (
        'PRO16',
        'Jugo de mango',
        201,
        328,
        true,
        'I',
        2,
        84,
        30,
        70,
        0.12
    ),
    (
        'PRO17',
        'Galleta de guayaba',
        414,
        515,
        true,
        'I',
        7,
        3,
        26,
        66,
        0.51
    ),
    (
        'PRO18',
        'Crema dental',
        122,
        191,
        false,
        'N',
        1,
        12,
        16,
        53,
        0.50
    ),
    (
        'PRO19',
        'Atamel',
        542,
        777,
        false,
        'N',
        1,
        5,
        30,
        38,
        0.8
    ),
    (
        'PRO20',
        'Manzana',
        203,
        426,
        true,
        'N',
        4,
        24,
        26,
        41,
        0.87
    ),
    (
        'PRO21',
        'Buscapina',
        499,
        524,
        false,
        'N',
        1,
        42,
        35,
        51,
        0.28
    ),
    (
        'PRO22',
        'Pera',
        501,
        598,
        true,
        'I',
        4,
        6,
        14,
        93,
        0.55
    ),
    (
        'PRO23',
        'Nispero',
        443,
        573,
        false,
        'I',
        4,
        66,
        21,
        96,
        0.53
    );


INSERT INTO lista_articulos
(
    factura_id,
    producto_id,
    cantidad
) VALUES
    (
        4,
        8,
        1
    ) RETURNING *;


INSERT INTO lista_articulos
(
    factura_id,
    producto_id,
    cantidad
)   VALUES
   (
        (SELECT f.factura_id FROM facturas AS f
            ORDER BY random() LIMIT 1),
        (SELECT
        p.producto_id
            FROM productos AS p
            WHERE p.producto_id NOT IN (6,9,16,21)
            ORDER BY random() LIMIT 1),
        11
   ),
   (
        (SELECT f.factura_id FROM facturas AS f
            ORDER BY random() LIMIT 1),
        (SELECT
        p.producto_id
            FROM productos AS p
            WHERE p.producto_id NOT IN (6,9,16,21)
            ORDER BY random() LIMIT 1),
        1
   );



       