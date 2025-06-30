-- =====================================================
-- MODELO RELACIONAL-OBJETUAL PARA BASE DE DATOS DE PELÍCULAS
-- PostgreSQL con características avanzadas
-- =====================================================

-- 1. CREACIÓN DE DOMINIOS PARA VALIDACIONES
-- =====================================================

-- Dominio para validar montos monetarios
CREATE DOMAIN monto_positivo AS NUMERIC(12,2)
CHECK (VALUE >= 0);

-- Dominio para salarios con rango específico
CREATE DOMAIN salario_actor AS NUMERIC(12,2)
CHECK (VALUE BETWEEN 600000.00 AND 4900000.00);

-- Dominio para estado civil
CREATE DOMAIN estado_civil_tipo AS VARCHAR(20)
CHECK (VALUE IN ('Soltero', 'Casado', 'Divorciado', 'Viudo', 'Union libre'));

-- Dominio para tipo de certamen
CREATE DOMAIN tipo_certamen AS VARCHAR(20)
CHECK (VALUE IN ('Nacional', 'Internacional'));

-- Dominio para tipo de actuación
CREATE DOMAIN tipo_actuacion AS VARCHAR(20)
CHECK (VALUE IN ('Protagonista', 'Secundario', 'De reparto', 'Extra'));

-- Dominio para ranking
CREATE DOMAIN ranking_pelicula AS NUMERIC(2,1)
CHECK (VALUE BETWEEN 1.0 AND 5.0);

-- Dominio para resumen de película
CREATE DOMAIN resumen_pelicula AS TEXT
CHECK (LENGTH(VALUE) BETWEEN 250 AND 450);

-- Dominio para fecha
CREATE DOMAIN fecha_formato AS DATE;

-- 2. CREACIÓN DE TIPOS COMPUESTOS
-- =====================================================

-- Tipo para información de contacto
CREATE TYPE info_contacto AS (
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    email VARCHAR(100)
);

-- Tipo para información personal
CREATE TYPE info_personal AS (
    fecha_nacimiento fecha_formato,
    lugar_nacimiento VARCHAR(100),
    estado_civil estado_civil_tipo,
    contacto info_contacto
);

-- Tipo para información de premio
CREATE TYPE info_premio AS (
    lugar_certamen VARCHAR(100),
    fecha fecha_formato,
    tipo tipo_certamen
);

-- Tipo para información de crítica
CREATE TYPE info_critica AS (
    medio VARCHAR(100),
    fecha fecha_formato,
    calificacion ranking_pelicula
);

-- 3. TABLAS BASE CON HERENCIA
-- =====================================================

-- Tabla base para personas
CREATE TABLE persona (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    informacion info_personal
);

-- Tabla de actores que hereda de persona
CREATE TABLE actor (
    tipo_actor tipo_actuacion DEFAULT 'Secundario'
) INHERITS (persona);

-- Tabla de directores que hereda de persona
CREATE TABLE director (
    años_experiencia INTEGER DEFAULT 0,
    peliculas_dirigidas INTEGER DEFAULT 0
) INHERITS (persona);

-- Tabla de productores que hereda de persona
CREATE TABLE productor (
    empresa_productora VARCHAR(100)
) INHERITS (persona);

-- Tabla de películas
CREATE TABLE pelicula (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    resumen resumen_pelicula,
    fecha_estreno fecha_formato,
    ranking ranking_pelicula,
    duracion_minutos INTEGER CHECK (duracion_minutos > 0)
);

-- Tabla de premios
CREATE TABLE premio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    autor VARCHAR(100),
    informacion info_premio
);

-- Tabla de críticas
CREATE TABLE critica (
    id SERIAL PRIMARY KEY,
    autor VARCHAR(100) NOT NULL,
    contenido TEXT,
    informacion info_critica
);

-- 4. TABLAS DE RELACIÓN
-- =====================================================

-- Relación actúa
CREATE TABLE actua (
    id_actor INTEGER NOT NULL,
    id_pelicula INTEGER NOT NULL REFERENCES pelicula(id),
    tipo tipo_actuacion DEFAULT 'Secundario',
    salario salario_actor,
    PRIMARY KEY (id_actor, id_pelicula)
);

-- Relación dirige
CREATE TABLE dirige (
    id_director INTEGER NOT NULL,
    id_pelicula INTEGER NOT NULL REFERENCES pelicula(id),
    fecha_inicio fecha_formato,
    fecha_fin fecha_formato,
    PRIMARY KEY (id_director, id_pelicula)
);

-- Relación produce
CREATE TABLE produce (
    id_productor INTEGER NOT NULL,
    id_pelicula INTEGER NOT NULL REFERENCES pelicula(id),
    aportacion_economica monto_positivo,
    PRIMARY KEY (id_productor, id_pelicula)
);

-- Relación pelicula-premio
CREATE TABLE pelicula_premio (
    id_pelicula INTEGER NOT NULL REFERENCES pelicula(id),
    id_premio INTEGER NOT NULL REFERENCES premio(id),
    fecha_otorgamiento fecha_formato,
    PRIMARY KEY (id_pelicula, id_premio)
);

-- Relación pelicula-critica
CREATE TABLE pelicula_critica (
    id_pelicula INTEGER NOT NULL REFERENCES pelicula(id),
    id_critica INTEGER NOT NULL REFERENCES critica(id),
    PRIMARY KEY (id_pelicula, id_critica)
);

-- 5. FUNCIONES PL/pgSQL
-- =====================================================

-- Función para calcular edad actual
CREATE OR REPLACE FUNCTION calcular_edad(info info_personal)
RETURNS INTEGER AS $$
BEGIN
    IF info.fecha_nacimiento IS NULL THEN
        RETURN NULL;
    END IF;
    RETURN EXTRACT(YEAR FROM AGE(CURRENT_DATE, info.fecha_nacimiento));
END;
$$ LANGUAGE plpgsql;

-- Función para obtener información completa de una persona
CREATE OR REPLACE FUNCTION obtener_info_persona(p_id INTEGER, tipo_persona VARCHAR)
RETURNS TABLE(
    id INTEGER,
    nombre VARCHAR,
    edad INTEGER,
    estado_civil VARCHAR,
    telefono VARCHAR
) AS $$
BEGIN
    IF tipo_persona = 'actor' THEN
        RETURN QUERY
        SELECT a.id, a.nombre, 
               calcular_edad(a.informacion),
               a.informacion.estado_civil,
               a.informacion.contacto.telefono
        FROM actor a
        WHERE a.id = p_id;
    ELSIF tipo_persona = 'director' THEN
        RETURN QUERY
        SELECT d.id, d.nombre,
               calcular_edad(d.informacion),
               d.informacion.estado_civil,
               d.informacion.contacto.telefono
        FROM director d
        WHERE d.id = p_id;
    ELSIF tipo_persona = 'productor' THEN
        RETURN QUERY
        SELECT p.id, p.nombre,
               calcular_edad(p.informacion),
               p.informacion.estado_civil,
               p.informacion.contacto.telefono
        FROM productor p
        WHERE p.id = p_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Función para validar presupuesto de película
CREATE OR REPLACE FUNCTION validar_presupuesto_pelicula(p_id_pelicula INTEGER)
RETURNS TABLE(
    total_aportaciones NUMERIC,
    total_salarios NUMERIC,
    balance NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        COALESCE(SUM(p.aportacion_economica), 0),
        COALESCE(SUM(a.salario), 0),
        COALESCE(SUM(p.aportacion_economica), 0) - COALESCE(SUM(a.salario), 0)
    FROM pelicula pel
    LEFT JOIN produce p ON pel.id = p.id_pelicula
    LEFT JOIN actua a ON pel.id = a.id_pelicula
    WHERE pel.id = p_id_pelicula;
END;
$$ LANGUAGE plpgsql;

-- 6. INSERCIÓN DE DATOS DE PRUEBA
-- =====================================================

-- Insertar actores
INSERT INTO actor (nombre, informacion, tipo_actor) VALUES
('Salvatore Cascio', ROW('1980-01-01', 'Roma', 'Soltero', ROW('5551234567', 'Via Roma 123', 'salvatore@email.com'))::info_personal, 'Protagonista'),
('Roberto Benigni', ROW('1952-10-27', 'Florencia', 'Casado', ROW('5557654321', 'Via Firenze 456', 'roberto@email.com'))::info_personal, 'Protagonista'),
('Marlon Brando', ROW('1924-04-03', 'Omaha', 'Divorciado', ROW('5551111111', 'Hollywood Blvd', 'marlon@email.com'))::info_personal, 'Protagonista'),
('Humphrey Bogart', ROW('1899-12-25', 'Nueva York', 'Viudo', ROW('5552222222', '5th Avenue', 'humphrey@email.com'))::info_personal, 'Protagonista'),
('Leonardo DiCaprio', ROW('1974-11-11', 'Los Angeles', 'Soltero', ROW('5553333333', 'Sunset Blvd', 'leo@email.com'))::info_personal, 'Protagonista'),
('Tom Hanks', ROW('1956-07-09', 'California', 'Casado', ROW('5554444444', 'California St', 'tom@email.com'))::info_personal, 'Protagonista'),
('John Travolta', ROW('1954-02-18', 'New Jersey', 'Casado', ROW('5555555555', 'Jersey Ave', 'john@email.com'))::info_personal, 'Protagonista'),
('Matthew Broderick', ROW('1962-03-21', 'Manhattan', 'Union libre', ROW('5556666666', 'Broadway', 'matthew@email.com'))::info_personal, 'Secundario');

-- Insertar directores
INSERT INTO director (nombre, informacion, años_experiencia, peliculas_dirigidas) VALUES
('Giuseppe Tornatore', ROW('1956-05-27', 'Sicilia', 'Casado', ROW('5551234567', 'Via Sicilia', 'giuseppe@email.com'))::info_personal, 30, 15),
('Roberto Benigni', ROW('1952-10-27', 'Florencia', 'Casado', ROW('5557654321', 'Via Firenze 456', 'roberto.dir@email.com'))::info_personal, 25, 10),
('Francis Ford Coppola', ROW('1939-04-07', 'Detroit', 'Casado', ROW('5551111222', 'Napa Valley', 'francis@email.com'))::info_personal, 45, 30),
('Michael Curtiz', ROW('1886-12-24', 'Budapest', 'Casado', ROW('5552223333', 'Hollywood', 'michael@email.com'))::info_personal, 50, 100),
('James Cameron', ROW('1954-08-16', 'Ontario', 'Divorciado', ROW('5553334444', 'Malibu', 'james@email.com'))::info_personal, 35, 20),
('Robert Zemeckis', ROW('1952-05-14', 'Chicago', 'Casado', ROW('5554445555', 'Chicago Ave', 'robert.z@email.com'))::info_personal, 40, 25),
('Quentin Tarantino', ROW('1963-03-27', 'Tennessee', 'Soltero', ROW('5555556666', 'LA Street', 'quentin@email.com'))::info_personal, 30, 10),
('Roger Allers', ROW('1949-06-29', 'New York', 'Casado', ROW('5556667777', 'Disney St', 'roger@email.com'))::info_personal, 35, 15);

-- Insertar productores
INSERT INTO productor (nombre, informacion, empresa_productora) VALUES
('Franco Cristaldi', ROW('1924-10-03', 'Turin', 'Casado', ROW('5557778888', 'Via Turin', 'franco@email.com'))::info_personal, 'Cristaldi Film'),
('Elda Ferri', ROW('1930-05-15', 'Roma', 'Viudo', ROW('5558889999', 'Via Roma', 'elda@email.com'))::info_personal, 'Ferri Productions'),
('Albert S. Ruddy', ROW('1930-03-28', 'Montreal', 'Casado', ROW('5559990000', 'Beverly Hills', 'albert@email.com'))::info_personal, 'Ruddy Productions'),
('Hal B. Wallis', ROW('1898-10-19', 'Chicago', 'Divorciado', ROW('5550001111', 'Paramount St', 'hal@email.com'))::info_personal, 'Wallis Productions'),
('James Cameron', ROW('1954-08-16', 'Ontario', 'Divorciado', ROW('5551112222', 'Malibu Beach', 'james.prod@email.com'))::info_personal, 'Lightstorm'),
('Wendy Finerman', ROW('1960-08-02', 'California', 'Casado', ROW('5552223333', 'Studio City', 'wendy@email.com'))::info_personal, 'Finerman Films'),
('Lawrence Bender', ROW('1957-10-17', 'Bronx', 'Soltero', ROW('5553334444', 'Venice Beach', 'lawrence@email.com'))::info_personal, 'A Band Apart'),
('Don Hahn', ROW('1955-11-26', 'Chicago', 'Casado', ROW('5554445555', 'Burbank', 'don@email.com'))::info_personal, 'Disney');

-- Insertar películas
INSERT INTO pelicula (titulo, resumen, fecha_estreno, ranking, duracion_minutos) VALUES
('Cinema Paradiso', 'Una emotiva historia sobre un niño que crece en un pequeño pueblo siciliano y su amistad con el proyeccionista del cine local. La película explora temas de nostalgia, amor por el cine y el paso del tiempo a través de flashbacks que narran la vida del protagonista desde su infancia hasta la edad adulta.', '1988-11-17', 4.8, 155),
('La vida es bella', 'Durante la Segunda Guerra Mundial, un padre judío italiano usa su imaginación y humor para proteger a su hijo de los horrores del campo de concentración nazi donde están prisioneros. Una conmovedora historia sobre el poder del amor paternal y la esperanza en medio de la tragedia más oscura.', '1997-12-20', 4.9, 116),
('El Padrino', 'La épica saga de la familia Corleone, una poderosa dinastía de la mafia italoamericana. La película narra la transformación de Michael Corleone de héroe de guerra a despiadado jefe mafioso, explorando temas de poder, familia, lealtad y la corrupción del sueño americano en el mundo del crimen organizado.', '1972-03-24', 4.7, 175),
('Casablanca', 'En el Casablanca de la Segunda Guerra Mundial, el cínico dueño de un café se debate entre el amor y la virtud cuando su antigua amante aparece pidiendo ayuda para ella y su esposo, un héroe de la resistencia. Una historia atemporal sobre sacrificio, amor y redención en tiempos de guerra.', '1942-11-26', 4.6, 102),
('Titanic', 'Una historia de amor épica entre Jack, un artista pobre, y Rose, una joven de la alta sociedad, a bordo del fatídico viaje inaugural del RMS Titanic. Su romance prohibido se desarrolla mientras el barco se dirige hacia su trágico destino, creando una narrativa que mezcla romance, drama y catástrofe histórica.', '1997-12-19', 4.4, 194),
('Forrest Gump', 'La extraordinaria vida de Forrest Gump, un hombre con limitaciones intelectuales pero un corazón puro, quien sin proponérselo se convierte en testigo y participante de momentos cruciales de la historia estadounidense del siglo XX, mientras busca reunirse con su amor de la infancia, Jenny.', '1994-07-06', 4.5, 142),
('Pulp Fiction', 'Múltiples historias criminales se entrelazan en Los Ángeles: dos asesinos a sueldo filosóficos, la esposa de un gángster, un boxeador que traiciona a la mafia y dos ladrones de poca monta. La narrativa no lineal y los diálogos ingeniosos crean un retrato único del bajo mundo criminal estadounidense.', '1994-10-14', 4.3, 154),
('El Rey León', 'Simba, un joven león príncipe, huye de su reino después de la muerte de su padre Mufasa, por la que se siente responsable. Años después, debe regresar para reclamar su lugar como rey y enfrentar a su malvado tío Scar. Una épica historia animada sobre madurez, responsabilidad y el círculo de la vida.', '1994-06-24', 4.2, 88);

-- Insertar premios
INSERT INTO premio (nombre, autor, informacion) VALUES
('Oscar', 'Academia', ROW('Los Angeles', '1990-03-25', 'Internacional')::info_premio),
('Cannes', 'Festival Cannes', ROW('Francia', '1998-05-15', 'Internacional')::info_premio),
('Globo de Oro', 'HFPA', ROW('Beverly Hills', '1973-01-28', 'Internacional')::info_premio),
('BAFTA', 'Academia Britanica', ROW('Londres', '1943-04-10', 'Internacional')::info_premio),
('Premio Goya', 'Academia Española', ROW('Madrid', '1998-02-14', 'Nacional')::info_premio),
('SAG Award', 'SAG', ROW('Los Angeles', '1995-02-25', 'Internacional')::info_premio),
('Palma de Oro', 'Festival Cannes', ROW('Cannes', '1994-05-23', 'Internacional')::info_premio),
('Annie Award', 'ASIFA', ROW('Los Angeles', '1995-03-18', 'Internacional')::info_premio);

-- Insertar críticas
INSERT INTO critica (autor, contenido, informacion) VALUES
('Juan Pérez', 'Una obra maestra del cine italiano que captura la nostalgia y el amor por el séptimo arte.', ROW('El Universal', '1990-08-20', 4.8)::info_critica),
('Claire Dubois', 'Benigni logra lo imposible: hacer reír en medio del horror del Holocausto.', ROW('Le Monde', '1998-01-15', 4.9)::info_critica),
('Vincent Canby', 'Coppola ha creado una obra épica que trasciende el género criminal.', ROW('The New York Times', '1972-05-20', 4.7)::info_critica),
('Abel Green', 'Casablanca define el romanticismo cinematográfico en tiempos de guerra.', ROW('Variety', '1943-03-05', 4.6)::info_critica),
('Peter Travers', 'Cameron combina espectáculo visual con una historia de amor genuina.', ROW('Rolling Stone', '1998-03-15', 4.4)::info_critica),
('Owen Gleiberman', 'Zemeckis crea magia pura con la historia de Forrest.', ROW('Entertainment Weekly', '1994-09-15', 4.5)::info_critica),
('Derek Malcolm', 'Tarantino reinventa el cine criminal con estilo inconfundible.', ROW('The Guardian', '1995-02-10', 4.3)::info_critica),
('Kenneth Turan', 'Disney alcanza nuevas alturas con esta fábula animada.', ROW('Los Angeles Times', '1994-08-25', 4.2)::info_critica);

-- Establecer relaciones
INSERT INTO actua (id_actor, id_pelicula, tipo, salario) VALUES
(1, 1, 'Protagonista', 700000.00),
(2, 2, 'Protagonista', 900000.00),
(3, 3, 'Protagonista', 1200000.00),
(4, 4, 'Protagonista', 650000.00),
(5, 5, 'Protagonista', 2500000.00),
(6, 6, 'Protagonista', 1800000.00),
(7, 7, 'Protagonista', 1500000.00),
(8, 8, 'Secundario', 2000000.00);

INSERT INTO dirige (id_director, id_pelicula) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO produce (id_productor, id_pelicula, aportacion_economica) VALUES
(1, 1, 1000000.00),
(2, 2, 2000000.00),
(3, 3, 5000000.00),
(4, 4, 800000.00),
(5, 5, 15000000.00),
(6, 6, 3500000.00),
(7, 7, 2800000.00),
(8, 8, 4200000.00);

INSERT INTO pelicula_premio (id_pelicula, id_premio, fecha_otorgamiento) VALUES
(1, 1, '1990-03-25'),
(2, 2, '1998-05-15'),
(3, 3, '1973-01-28'),
(4, 4, '1943-04-10'),
(5, 5, '1998-02-14'),
(6, 6, '1995-02-25'),
(7, 7, '1994-05-23'),
(8, 8, '1995-03-18');

INSERT INTO pelicula_critica (id_pelicula, id_critica) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- 7. CONSULTAS DE NEGOCIO
-- =====================================================

-- A) Total de salarios pagados a los actores de "Cinema Paradiso"
CREATE OR REPLACE FUNCTION consulta_a() 
RETURNS TABLE(
    pelicula VARCHAR,
    director VARCHAR,
    actor VARCHAR,
    salario NUMERIC,
    total_salarios NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.titulo,
        d.nombre,
        a.nombre,
        act.salario,
        SUM(act.salario) OVER()
    FROM pelicula p
    JOIN dirige dir ON p.id = dir.id_pelicula
    JOIN director d ON dir.id_director = d.id
    JOIN actua act ON p.id = act.id_pelicula
    JOIN actor a ON act.id_actor = a.id
    WHERE p.titulo = 'Cinema Paradiso'
      AND d.nombre = 'Giuseppe Tornatore';
END;
$$ LANGUAGE plpgsql;

-- Ejecutar: SELECT * FROM consulta_a();

-- B) Premios recibidos por "Cinema Paradiso"
CREATE OR REPLACE FUNCTION consulta_b()
RETURNS TABLE(
    pelicula VARCHAR,
    ranking NUMERIC,
    premio VARCHAR,
    lugar_certamen VARCHAR,
    tipo_certamen VARCHAR,
    fecha_premio DATE
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.titulo,
        p.ranking,
        pr.nombre,
        pr.informacion.lugar_certamen,
        pr.informacion.tipo,
        pr.informacion.fecha
    FROM pelicula p
    JOIN dirige dir ON p.id = dir.id_pelicula
    JOIN director d ON dir.id_director = d.id
    JOIN pelicula_premio pp ON p.id = pp.id_pelicula
    JOIN premio pr ON pp.id_premio = pr.id
    WHERE p.titulo = 'Cinema Paradiso'
      AND d.nombre = 'Giuseppe Tornatore'
    ORDER BY p.ranking DESC;
END;
$$ LANGUAGE plpgsql;

-- Ejecutar: SELECT * FROM consulta_b();

-- C) Total de aportes económicos del productor "Franco Cristaldi"
CREATE OR REPLACE FUNCTION consulta_c()
RETURNS TABLE(
    productor VARCHAR,
    peliculas_producidas BIGINT,
    total_aportes NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        prod.nombre,
        COUNT(DISTINCT p.id_pelicula),
        SUM(p.aportacion_economica)
    FROM productor prod
    JOIN produce p ON prod.id = p.id_productor
    WHERE prod.nombre = 'Franco Cristaldi'
    GROUP BY prod.nombre;
END;
$$ LANGUAGE plpgsql;

-- Ejecutar: SELECT * FROM consulta_c();

-- D) Críticas de "Cinema Paradiso" entre fechas específicas
CREATE OR REPLACE FUNCTION consulta_d()
RETURNS TABLE(
    pelicula VARCHAR,
    medio VARCHAR,
    fecha_critica DATE,
    autor VARCHAR,
    calificacion NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.titulo,
        c.informacion.medio,
        c.informacion.fecha,
        c.autor,
        c.informacion.calificacion
    FROM pelicula p
    JOIN dirige dir ON p.id = dir.id_pelicula
    JOIN director d ON dir.id_director = d.id
    JOIN pelicula_critica pc ON p.id = pc.id_pelicula
    JOIN critica c ON pc.id_critica = c.id
    WHERE p.titulo = 'Cinema Paradiso'
      AND d.nombre = 'Giuseppe Tornatore'
      AND c.informacion.fecha BETWEEN '1990-08-15' AND '1990-08-30'
    ORDER BY c.informacion.fecha DESC;
END;
$$ LANGUAGE plpgsql;

-- Ejecutar: SELECT * FROM consulta_d();

-- E) Todas las personas involucradas en "Cinema Paradiso"
CREATE OR REPLACE FUNCTION consulta_e()
RETURNS TABLE(
    rol VARCHAR,
    nombre VARCHAR,
    edad_actual INTEGER,
    estado_civil VARCHAR,
    telefono VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    -- Actores
    SELECT 
        'Actor'::VARCHAR,
        a.nombre,
        calcular_edad(a.informacion),
        a.informacion.estado_civil::VARCHAR,
        a.informacion.contacto.telefono
    FROM actor a
    JOIN actua act ON a.id = act.id_actor
    JOIN pelicula p ON act.id_pelicula = p.id
    WHERE p.titulo = 'Cinema Paradiso'
    
    UNION ALL
    
    -- Directores
    SELECT 
        'Director'::VARCHAR,
        d.nombre,
        calcular_edad(d.informacion),
        d.informacion.estado_civil::VARCHAR,
        d.informacion.contacto.telefono
    FROM director d
    JOIN dirige dir ON d.id = dir.id_director
    JOIN pelicula p ON dir.id_pelicula = p.id
    WHERE p.titulo = 'Cinema Paradiso'
    
    UNION ALL
    
    -- Productores
    SELECT 
        'Productor'::VARCHAR,
        prod.nombre,
        calcular_edad(prod.informacion),
        prod.informacion.estado_civil::VARCHAR,
        prod.informacion.contacto.telefono
    FROM productor prod
    JOIN produce pr ON prod.id = pr.id_productor
    JOIN pelicula p ON pr.id_pelicula = p.id
    WHERE p.titulo = 'Cinema Paradiso'
    
    ORDER BY rol, nombre;
END;
$$ LANGUAGE plpgsql;

-- Ejecutar: SELECT * FROM consulta_e();

-- 8. VISTAS ÚTILES
-- =====================================================

-- Vista materializada para estadísticas de películas
CREATE MATERIALIZED VIEW estadisticas_peliculas AS
SELECT 
    p.id,
    p.titulo,
    p.ranking,
    COUNT(DISTINCT a.id_actor) as total_actores,
    COUNT(DISTINCT pr.id_premio) as total_premios,
    COUNT(DISTINCT c.id_critica) as total_criticas,
    SUM(prod.aportacion_economica) as presupuesto_total,
    SUM(act.salario) as salarios_totales
FROM pelicula p
LEFT JOIN actua act ON p.id = act.id_pelicula
LEFT JOIN actor a ON act.id_actor = a.id
LEFT JOIN pelicula_premio pp ON p.id = pp.id_pelicula
LEFT JOIN premio pr ON pp.id_premio = pr.id
LEFT JOIN pelicula_critica pc ON p.id = pc.id_pelicula
LEFT JOIN critica c ON pc.id_critica = c.id
LEFT JOIN produce prod ON p.id = prod.id_pelicula
GROUP BY p.id, p.titulo, p.ranking;

-- Trigger para validar consistencia
CREATE OR REPLACE FUNCTION validar_fechas_filmacion()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.fecha_fin < NEW.fecha_inicio THEN
        RAISE EXCEPTION 'La fecha de fin no puede ser anterior a la fecha de inicio';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_fechas
BEFORE INSERT OR UPDATE ON dirige
FOR EACH ROW
EXECUTE FUNCTION validar_fechas_filmacion();