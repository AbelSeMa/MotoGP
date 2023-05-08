DROP TABLE IF EXISTS equipos CASCADE;

CREATE TABLE equipos (
    id              bigserial       PRIMARY KEY,
    nombre          varchar(50)     NOT NULL,
    año_fundacion   int             NOT NULL,
    pais            varchar(20)     NOT NULL,
    moto_id         bigint          NOT NULL REFERENCES motos(id)
);


DROP TABLE IF EXISTS motos CASCADE;

CREATE TABLE motos (
    id              bigserial       PRIMARY KEY,
    nombre          varchar(50)     NOT NULL,
    cilindrada      int             NOT NULL,
    peso            int             NOT NULL    
);


DROP TABLE IF EXISTS pilotos CASCADE;

CREATE TABLE pilotos (
    id              bigserial       PRIMARY KEY,
    nombre          varchar(100)    NOT NULL,
    apellido        varchar(100)    NOT NULL,
    edad            int             NOT NULL,
    nacionalidad    varchar(10)     NOT NULL,
    dorsal          numeric(2)      NOT NULL UNIQUE,
    moto_id         bigint          NOT NULL REFERENCES motos(id)
);


DROP TABLE IF EXISTS carreras CASCADE;

CREATE TABLE carreras (
    id              bigserial   PRIMARY KEY,
    fecha           date        NOT NULL,
    circuito_id     bigint      NOT NULL REFERENCES circuitos(id)

);

DROP TABLE IF EXISTS piloto_carrera CASCADE;

CREATE TABLE piloto_carrera (
    piloto_id       bigint      NOT NULL REFERENCES pilotos(id),
    carrera_id      bigint      NOT NULL REFERENCES carreras(id),
    posicion        int         NOT NULL,
    puntos          int         NOT NULL,
    PRIMARY KEY (piloto_id, carrera_id)

);


DROP TABLE IF EXISTS circuitos CASCADE;

CREATE TABLE circuitos (
    id                  bigserial   PRIMARY KEY,
    nombre              varchar(255) NOT NULL,
    pais                varchar(50) NOT NULL,
    longitud    bigint      NOT NULL
);

-- Carga inicial de los datos:

INSERT INTO circuitos (nombre, pais, longitud)
        VALUES ('Portimao', 'Portugal', 4653),
                ('Circuito Termas de Río', 'Argentina', 4806),
                ('Circuit of The Americas', 'Estados Unidos', 5513),
                ('Circuito de Jerez - Ángel Nieto', 'España', 4423),
                ('Le Mans', 'Francia', 4190),
                ('Mugello', 'Italia', 5245),
                ('Sachsenring', 'Alemania', 3658),
                ('Circuit Assen', 'Holanda', 4476),
                ('Silverstone Circuit', 'Gran Bretaña', 5903),
                ('Red Bull Ring', 'Austria', 4310),
                ('Circuit de Barcelona', 'España', 4785),
                ('Misano World Circuit Marco Simoncelli', 'Italia', 4133),
                ('Buddh International Circuit', 'India', 5013),
                ('Mobility Resort Motegi', 'Japón', 4802),
                ('Mandalika International Street Circuit', 'Indonesia', 4276),
                ('Phillip Island', 'Australia', 4467),
                ('Chang International Circuit', 'Tailandia', 4566),
                ('Sepang International Circuit', 'Malasia', 5488),
                ('Lusail International Circuit', 'Qatar', 5408),
                ('Circuit Ricardo Tormo', 'España', 4000);

INSERT INTO carreras (fecha, circuito_id)
        VALUES ('26-03-2023', 1),
                ('02-04-2023', 2),
                ('16-04-2023', 3),
                ('30-03-2023', 4),
                ('14-05-2023', 5),
                ('11-06-2023', 6),
                ('18-06-2023', 7),
                ('25-06-2023', 8),
                ('06-08-2023', 9),
                ('20-08-2023', 10),
                ('03-09-2023', 11),
                ('10-09-2023', 12),
                ('24-09-2023', 13),
                ('01-10-2023', 14),
                ('15-10-2023', 15),
                ('22-10-2023', 16),
                ('29-10-2023', 17),
                ('12-11-2023', 18),
                ('19-11-2023', 19),
                ('26-11-2023', 20);

INSERT INTO equipos (nombre, año_fundacion, pais, moto_id)
            VALUES ('Aprilia Racing Team', 2015, 'Italia', 4),
                    ('Ducati Team', 1999, 'Italia', 2),
                    ('Gresini Racing', 1997, 'Italia', 3),
                    ('Pramac Racing', 2002, 'Italia', 2),
                    ('Red Bull KTM Factory Racing', 2015, 'Austria', 5),
                    ('Repsol Honda Team', 2015, 'Japón', 1),
                    ('RNF MotoGP Racing', 2021, 'Malasia', 4),
                    ('LCR Honda', 1996, 'Monaco', 1),
                    ('VR46 Racing Team', 2014, 'Italia', 3),
                    ('Tech3', 1989, 'Francia', 7),
                    ('Yamaha Factory Racing', 1999, 'Italia', 6);


INSERT INTO motos (nombre, cilindrada, peso)
            VALUES ('Honda RC213V', 1000, 160),
                    ('Ducati Desmosedici GP23', 1000, 160),
                    ('Ducati Desmosedici GP22', 1000, 160),
                    ('Aprilia RS-GP', 1000, 160),
                    ('KTM RC16', 1000, 160),
                    ('Yamaha YZR-M1', 1000, 160),
                    ('Gas Gas RC16', 1000, 160);


INSERT INTO pilotos (nombre, apellido, edad, nacionalidad, dorsal, moto_id)
            VALUES ('Maverick', 'Viñales', 28, 'ESP', 12, 4),
                    ('Aleix', 'Espargaró', 33, 'ESP', 41, 4),
                    ('Pecco', 'Bagnaia', 26, 'ITA', 1, 2),
                    ('Enea', 'Bastianini', 25, 'ITA', 23, 2),
                    ('Fabio', 'Di Giannantonio', 24, 'ITA', 49, 3),
                    ('Alex', 'Marquez', 27, 'ESP', 73, 3),
                    ('Johann', 'Zarcot', 32, 'FRA', 5, 2),
                    ('Jorge', 'Martín', 25, 'ESP', 89, 2),
                    ('Brad', 'Blinder', 27, 'ZAF', 33, 5),
                    ('Jack', 'Miller', 28, 'AUS', 43, 5),
                    ('Joan', 'Mir', 25, 'ESP', 36, 1),
                    ('Marc', 'Marquez', 30, 'ESP', 93, 1),
                    ('Raúl', 'Fernandez', 23, 'ESP', 25, 4),
                    ('Miguel', 'Oliveira', 28, 'POR', 88, 4),
                    ('Takaaki', 'Nakagami', 31, 'JAP', 30, 1),
                    ('Alex', 'Rins', 27, 'ESP', 42, 1),
                    ('Luca', 'Marini', 25, 'ITA', 10, 3),
                    ('Marco', 'Bezzecchi', 24, 'ITA', 72, 3),
                    ('Augusto', 'Fernandez', 25, 'ESP', 37, 7),
                    ('Pol', 'Espargaró', 31, 'ESP', 44, 7),
                    ('Fabio', 'Quartararo', 24, 'ITA', 20, 6),
                    ('Franco', 'Morbidelli', 28, 'ITA', 21, 6);