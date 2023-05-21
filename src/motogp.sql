DROP TABLE IF EXISTS equipos CASCADE;

CREATE TABLE equipos (
    id              bigserial       PRIMARY KEY,
    equipo          varchar(50)     NOT NULL,
    año_fundacion   int             NOT NULL,
    pais            varchar(20)     NOT NULL,
    moto_id         bigint          NOT NULL REFERENCES motos(id)
);


DROP TABLE IF EXISTS motos CASCADE;

CREATE TABLE motos (
    id              bigserial       PRIMARY KEY,
    moto          varchar(50)     NOT NULL,
    fabricante      varchar(100)    NOT NULL,
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
    circuito              varchar(255) NOT NULL,
    pais                varchar(50) NOT NULL,
    longitud    bigint      NOT NULL
);

-- Carga inicial de los datos:

INSERT INTO piloto_carrera (
    
)


INSERT INTO circuitos (circuito, pais, longitud)
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

INSERT INTO equipos (equipo, año_fundacion, pais, moto_id)
            VALUES  ('Repsol Honda Team', 2015, 'Japón', 1),
                    ('LCR Honda', 1996, 'Monaco', 2),
                    ('Ducati Team', 1999, 'Italia', 3),
                    ('Pramac Racing', 2002, 'Italia', 4),
                    ('Gresini Racing', 1997, 'Italia', 5),
                    ('VR46 Racing Team', 2014, 'Italia', 6),
                    ('Aprilia Racing Team', 2015, 'Italia', 7),
                    ('RNF MotoGP Racing', 2021, 'Malasia', 8),
                    ('Red Bull KTM Factory Racing', 2015, 'Austria', 9),
                    ('Yamaha Factory Racing', 1999, 'Italia', 10),
                    ('Tech3', 1989, 'Francia', 11);


INSERT INTO motos (moto, fabricante, cilindrada, peso)
            VALUES ('Honda RC213V 2023', 'Honda', 1000, 160),
                    ('Honda RC213V 2022', 'Honda', 1000, 160),
                    ('Ducati Desmosedici GP23 V1', 'Ducati', 1000, 160),
                    ('Ducati Desmosedici GP23 V2', 'Ducati', 1000, 160),
                    ('Ducati Desmosedici GP22 V1', 'Ducati', 1000, 160),
                    ('Ducati Desmosedici GP22 V2', 'Ducati', 1000, 160),
                    ('Aprilia RS-GP 2023', 'Aprillia', 1000, 160),
                    ('Aprilia RS-GP 2022', 'Aprillia', 1000, 160),
                    ('KTM RC16', 'KTM' ,1000, 160),
                    ('Yamaha YZR-M1', 'Yamaha', 1000, 160),
                    ('Gas Gas RC16', 'KTM', 1000, 160);


INSERT INTO pilotos (nombre, apellido, edad, nacionalidad, dorsal, moto_id)
            VALUES  ('Marc', 'Marquez', 30, 'ESP', 93, 1),
                    ('Joan', 'Mir', 25, 'ESP', 36, 1),
                    ('Takaaki', 'Nakagami', 31, 'JAP', 30, 2),
                    ('Alex', 'Rins', 27, 'ESP', 42, 2),
                    ('Pecco', 'Bagnaia', 26, 'ITA', 1, 3),
                    ('Enea', 'Bastianini', 25, 'ITA', 23, 3),
                    ('Alex', 'Marquez', 27, 'ESP', 73, 4),
                    ('Fabio', 'Di Giannantonio', 24, 'ITA', 49, 4),
                    ('Johann', 'Zarcot', 32, 'FRA', 5, 5),
                    ('Jorge', 'Martín', 25, 'ESP', 89, 5),
                    ('Luca', 'Marini', 25, 'ITA', 10, 6),
                    ('Marco', 'Bezzecchi', 24, 'ITA', 72, 6),
                    ('Maverick', 'Viñales', 28, 'ESP', 12, 7),
                    ('Aleix', 'Espargaró', 33, 'ESP', 41, 7),
                    ('Raúl', 'Fernandez', 23, 'ESP', 25, 8),
                    ('Miguel', 'Oliveira', 28, 'POR', 88, 8),
                    ('Brad', 'Blinder', 27, 'ZAF', 33, 9),
                    ('Jack', 'Miller', 28, 'AUS', 43, 9),
                    ('Fabio', 'Quartararo', 24, 'ITA', 20, 10),
                    ('Franco', 'Morbidelli', 28, 'ITA', 21, 10),
                    ('Augusto', 'Fernandez', 25, 'ESP', 37, 11),
                    ('Pol', 'Espargaró', 31, 'ESP', 44, 11);