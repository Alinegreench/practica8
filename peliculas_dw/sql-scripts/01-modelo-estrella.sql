-- Creación de las dimensiones
CREATE TABLE dim_pelicula (
    id_pelicula SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    resumen TEXT,
    fecha_estreno DATE
);
CREATE TABLE dim_actor (
    id_actor SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    estado_civil VARCHAR(20) CHECK (estado_civil IN ('Soltero', 'Casado', 'Divorciado', 'Viudo', 'Union libre')),
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);
CREATE TABLE dim_director (
    id_director SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);
CREATE TABLE dim_productor (
    id_productor SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);
CREATE TABLE dim_fecha (
    id_fecha SERIAL PRIMARY KEY,
    ano INT,
    mes INT,
    dia INT
);
CREATE TABLE dim_premio (
    id_premio SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    lugar_certamen VARCHAR(100),
    tipo_certamen VARCHAR(20) CHECK (tipo_certamen IN ('Nacional', 'Internacional')),
    fecha DATE,
    autor VARCHAR(100)
);
CREATE TABLE dim_critica (
    id_critica SERIAL PRIMARY KEY,
    medio VARCHAR(100),
    fecha DATE,
    autor VARCHAR(100)
);
-- Tabla de hechos
CREATE TABLE hechos_participacion (
    id_hecho SERIAL PRIMARY KEY,
    id_pelicula INT REFERENCES dim_pelicula(id_pelicula),
    id_actor INT REFERENCES dim_actor(id_actor),
    id_director INT REFERENCES dim_director(id_director),
    id_productor INT REFERENCES dim_productor(id_productor),
    id_fecha INT REFERENCES dim_fecha(id_fecha),
    id_premio INT REFERENCES dim_premio(id_premio),
    id_critica INT REFERENCES dim_critica(id_critica),
    aportacion_economica NUMERIC(12,2) CHECK (aportacion_economica >= 0),
    salario NUMERIC(12,2) CHECK (salario BETWEEN 600000 AND 4900000),
    ranking NUMERIC(2,1) CHECK (ranking BETWEEN 1.0 AND 5.0)
);

-- Inserciones - 8 registros por tabla

-- Películas (8 registros)
INSERT INTO dim_pelicula (nombre, resumen, fecha_estreno)
VALUES 
('Cinema Paradiso', repeat('Una gran película. ', 20), '1988-11-17'),
('La vida es bella', repeat('Película italiana conmovedora. ', 20), '1997-12-20'),
('El Padrino', repeat('Clásico del cine de mafia. ', 20), '1972-03-24'),
('Casablanca', repeat('Romance en tiempos de guerra. ', 20), '1942-11-26'),
('Titanic', repeat('Historia de amor épica. ', 20), '1997-12-19'),
('Forrest Gump', repeat('La vida de un hombre extraordinario. ', 20), '1994-07-06'),
('Pulp Fiction', repeat('Historias entrelazadas de crimen. ', 20), '1994-10-14'),
('El Rey León', repeat('Aventura animada en la sabana. ', 20), '1994-06-24');

-- Actores (8 registros)
INSERT INTO dim_actor (nombre, estado_civil, telefono, fecha_nacimiento)
VALUES 
('Salvatore Cascio', 'Soltero', '5551234567', '1980-01-01'),
('Roberto Benigni', 'Casado', '5557654321', '1952-10-27'),
('Marlon Brando', 'Divorciado', '5551111111', '1924-04-03'),
('Humphrey Bogart', 'Viudo', '5552222222', '1899-12-25'),
('Leonardo DiCaprio', 'Soltero', '5553333333', '1974-11-11'),
('Tom Hanks', 'Casado', '5554444444', '1956-07-09'),
('John Travolta', 'Casado', '5555555555', '1954-02-18'),
('Matthew Broderick', 'Union libre', '5556666666', '1962-03-21');

-- Directores (8 registros)
INSERT INTO dim_director (nombre)
VALUES 
('Giuseppe Tornatore'),
('Roberto Benigni'),
('Francis Ford Coppola'),
('Michael Curtiz'),
('James Cameron'),
('Robert Zemeckis'),
('Quentin Tarantino'),
('Roger Allers');

-- Productores (8 registros)
INSERT INTO dim_productor (nombre)
VALUES 
('Franco Cristaldi'),
('Elda Ferri'),
('Albert S. Ruddy'),
('Hal B. Wallis'),
('James Cameron'),
('Wendy Finerman'),
('Lawrence Bender'),
('Don Hahn');

-- Fechas (8 registros)
INSERT INTO dim_fecha (ano, mes, dia)
VALUES 
(1990, 8, 20),
(1998, 1, 10),
(1972, 5, 15),
(1943, 2, 28),
(1998, 3, 12),
(1994, 9, 8),
(1995, 1, 25),
(1994, 8, 18);

-- Premios (8 registros)
INSERT INTO dim_premio (nombre, lugar_certamen, tipo_certamen, fecha, autor)
VALUES 
('Oscar', 'Los Angeles', 'Internacional', '1990-03-25', 'Academia'),
('Cannes', 'Francia', 'Internacional', '1998-05-15', 'Festival Cannes'),
('Globo de Oro', 'Beverly Hills', 'Internacional', '1973-01-28', 'HFPA'),
('BAFTA', 'Londres', 'Internacional', '1943-04-10', 'Academia Britanica'),
('Premio Goya', 'Madrid', 'Nacional', '1998-02-14', 'Academia Española'),
('SAG Award', 'Los Angeles', 'Internacional', '1995-02-25', 'SAG'),
('Palma de Oro', 'Cannes', 'Internacional', '1994-05-23', 'Festival Cannes'),
('Annie Award', 'Los Angeles', 'Internacional', '1995-03-18', 'ASIFA');

-- Críticas (8 registros)
INSERT INTO dim_critica (medio, fecha, autor)
VALUES 
('El Universal', '1990-08-20', 'Juan Pérez'),
('Le Monde', '1998-01-15', 'Claire Dubois'),
('The New York Times', '1972-05-20', 'Vincent Canby'),
('Variety', '1943-03-05', 'Abel Green'),
('Rolling Stone', '1998-03-15', 'Peter Travers'),
('Entertainment Weekly', '1994-09-15', 'Owen Gleiberman'),
('The Guardian', '1995-02-10', 'Derek Malcolm'),
('Los Angeles Times', '1994-08-25', 'Kenneth Turan');

-- Tabla de hechos (8 registros)
INSERT INTO hechos_participacion (
    id_pelicula, id_actor, id_director, id_productor, id_fecha, id_premio, id_critica,
    aportacion_economica, salario, ranking
) VALUES 
(1, 1, 1, 1, 1, 1, 1, 1000000.00, 700000.00, 4.8),
(2, 2, 2, 2, 2, 2, 2, 2000000.00, 900000.00, 4.9),
(3, 3, 3, 3, 3, 3, 3, 5000000.00, 1200000.00, 4.7),
(4, 4, 4, 4, 4, 4, 4, 800000.00, 650000.00, 4.6),
(5, 5, 5, 5, 5, 5, 5, 15000000.00, 2500000.00, 4.4),
(6, 6, 6, 6, 6, 6, 6, 3500000.00, 1800000.00, 4.5),
(7, 7, 7, 7, 7, 7, 7, 2800000.00, 1500000.00, 4.3),
(8, 8, 8, 8, 8, 8, 8, 4200000.00, 2000000.00, 4.2);
