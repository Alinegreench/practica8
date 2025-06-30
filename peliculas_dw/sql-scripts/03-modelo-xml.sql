-- 03-modelo-xml.sql

-- 1. Crear tabla para XML
DROP TABLE IF EXISTS peliculas_completo_xml;
CREATE TABLE peliculas_completo_xml (
    id SERIAL PRIMARY KEY,
    datos XML NOT NULL
);

-- 2. Borrar registros previos si hay
DELETE FROM peliculas_completo_xml;

-- 3. Insertar 8 películas en XML, bien formadas
INSERT INTO peliculas_completo_xml (datos) VALUES
($$
<pelicula id="1">
  <nombre>Cinema Paradiso</nombre>
  <resumen>Una gran película.</resumen>
  <fecha_estreno>1988-11-17</fecha_estreno>
  <director>Giuseppe Tornatore</director>
  <productor>Franco Cristaldi</productor>
  <actores>
    <actor>Salvatore Cascio</actor>
  </actores>
  <premios>
    <premio>
      <nombre>Oscar</nombre>
      <lugar>Los Angeles</lugar>
      <tipo>Internacional</tipo>
      <fecha>1990-03-25</fecha>
      <autor>Academia</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>El Universal</medio>
      <fecha>1990-08-20</fecha>
      <autor>Juan Pérez</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Salvatore Cascio">700000.00</salario>
  </salarios>
  <ranking>4.8</ranking>
  <aportacion_economica>1000000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="2">
  <nombre>La vida es bella</nombre>
  <resumen>Película italiana conmovedora.</resumen>
  <fecha_estreno>1997-12-20</fecha_estreno>
  <director>Roberto Benigni</director>
  <productor>Elda Ferri</productor>
  <actores>
    <actor>Roberto Benigni</actor>
  </actores>
  <premios>
    <premio>
      <nombre>Cannes</nombre>
      <lugar>Francia</lugar>
      <tipo>Internacional</tipo>
      <fecha>1998-05-15</fecha>
      <autor>Festival Cannes</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>Le Monde</medio>
      <fecha>1998-01-15</fecha>
      <autor>Claire Dubois</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Roberto Benigni">900000.00</salario>
  </salarios>
  <ranking>4.9</ranking>
  <aportacion_economica>2000000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="3">
  <nombre>El Padrino</nombre>
  <resumen>Clásico del cine de mafia.</resumen>
  <fecha_estreno>1972-03-24</fecha_estreno>
  <director>Francis Ford Coppola</director>
  <productor>Albert S. Ruddy</productor>
  <actores>
    <actor>Marlon Brando</actor>
  </actores>
  <premios>
    <premio>
      <nombre>Globo de Oro</nombre>
      <lugar>Beverly Hills</lugar>
      <tipo>Internacional</tipo>
      <fecha>1973-01-28</fecha>
      <autor>HFPA</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>The New York Times</medio>
      <fecha>1972-05-20</fecha>
      <autor>Vincent Canby</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Marlon Brando">1200000.00</salario>
  </salarios>
  <ranking>4.7</ranking>
  <aportacion_economica>5000000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="4">
  <nombre>Casablanca</nombre>
  <resumen>Romance en tiempos de guerra.</resumen>
  <fecha_estreno>1942-11-26</fecha_estreno>
  <director>Michael Curtiz</director>
  <productor>Hal B. Wallis</productor>
  <actores>
    <actor>Humphrey Bogart</actor>
  </actores>
  <premios>
    <premio>
      <nombre>BAFTA</nombre>
      <lugar>Londres</lugar>
      <tipo>Internacional</tipo>
      <fecha>1943-04-10</fecha>
      <autor>Academia Britanica</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>Variety</medio>
      <fecha>1943-03-05</fecha>
      <autor>Abel Green</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Humphrey Bogart">650000.00</salario>
  </salarios>
  <ranking>4.6</ranking>
  <aportacion_economica>800000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="5">
  <nombre>Titanic</nombre>
  <resumen>Historia de amor épica.</resumen>
  <fecha_estreno>1997-12-19</fecha_estreno>
  <director>James Cameron</director>
  <productor>James Cameron</productor>
  <actores>
    <actor>Leonardo DiCaprio</actor>
  </actores>
  <premios>
    <premio>
      <nombre>Premio Goya</nombre>
      <lugar>Madrid</lugar>
      <tipo>Nacional</tipo>
      <fecha>1998-02-14</fecha>
      <autor>Academia Española</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>Rolling Stone</medio>
      <fecha>1998-03-15</fecha>
      <autor>Peter Travers</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Leonardo DiCaprio">2500000.00</salario>
  </salarios>
  <ranking>4.4</ranking>
  <aportacion_economica>15000000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="6">
  <nombre>Forrest Gump</nombre>
  <resumen>La vida de un hombre extraordinario.</resumen>
  <fecha_estreno>1994-07-06</fecha_estreno>
  <director>Robert Zemeckis</director>
  <productor>Wendy Finerman</productor>
  <actores>
    <actor>Tom Hanks</actor>
  </actores>
  <premios>
    <premio>
      <nombre>SAG Award</nombre>
      <lugar>Los Angeles</lugar>
      <tipo>Internacional</tipo>
      <fecha>1995-02-25</fecha>
      <autor>SAG</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>Entertainment Weekly</medio>
      <fecha>1994-09-15</fecha>
      <autor>Owen Gleiberman</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Tom Hanks">1800000.00</salario>
  </salarios>
  <ranking>4.5</ranking>
  <aportacion_economica>3500000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="7">
  <nombre>Pulp Fiction</nombre>
  <resumen>Historias entrelazadas de crimen.</resumen>
  <fecha_estreno>1994-10-14</fecha_estreno>
  <director>Quentin Tarantino</director>
  <productor>Lawrence Bender</productor>
  <actores>
    <actor>John Travolta</actor>
  </actores>
  <premios>
    <premio>
      <nombre>Palma de Oro</nombre>
      <lugar>Cannes</lugar>
      <tipo>Internacional</tipo>
      <fecha>1994-05-23</fecha>
      <autor>Festival Cannes</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>The Guardian</medio>
      <fecha>1995-02-10</fecha>
      <autor>Derek Malcolm</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="John Travolta">1500000.00</salario>
  </salarios>
  <ranking>4.3</ranking>
  <aportacion_economica>2800000.00</aportacion_economica>
</pelicula>
$$),
($$
<pelicula id="8">
  <nombre>El Rey León</nombre>
  <resumen>Aventura animada en la sabana.</resumen>
  <fecha_estreno>1994-06-24</fecha_estreno>
  <director>Roger Allers</director>
  <productor>Don Hahn</productor>
  <actores>
    <actor>Matthew Broderick</actor>
  </actores>
  <premios>
    <premio>
      <nombre>Annie Award</nombre>
      <lugar>Los Angeles</lugar>
      <tipo>Internacional</tipo>
      <fecha>1995-03-18</fecha>
      <autor>ASIFA</autor>
    </premio>
  </premios>
  <criticas>
    <critica>
      <medio>Los Angeles Times</medio>
      <fecha>1994-08-25</fecha>
      <autor>Kenneth Turan</autor>
    </critica>
  </criticas>
  <salarios>
    <salario actor="Matthew Broderick">2000000.00</salario>
  </salarios>
  <ranking>4.2</ranking>
  <aportacion_economica>4200000.00</aportacion_economica>
</pelicula>
$$);

-- 4. Consultas de prueba con XPath

-- A) Total salarios pagados a actores de "Cinema Paradiso" dirigido por "Giuseppe Tornatore"
SELECT sum((xpath('//salario/text()', datos))[1]::text::numeric) AS total_salarios
FROM peliculas_completo_xml
WHERE xpath('//nombre/text()', datos)::text = '{Cinema Paradiso}'
  AND xpath('//director/text()', datos)::text = '{Giuseppe Tornatore}';

-- B) Listado de premios recibidos por "Cinema Paradiso" dirigido por "Giuseppe Tornatore"
SELECT
  unnest(xpath('//premio/nombre/text()', datos))::text AS premio_nombre,
  unnest(xpath('//premio/lugar/text()', datos))::text AS lugar_certamen,
  (xpath('//ranking/text()', datos))[1]::text::numeric AS ranking
FROM peliculas_completo_xml
WHERE xpath('//nombre/text()', datos)::text = '{Cinema Paradiso}'
  AND xpath('//director/text()', datos)::text = '{Giuseppe Tornatore}'
ORDER BY ranking DESC;

-- C) Total de aportes económicos realizados por el productor "Franco Cristaldi"
SELECT sum((xpath('//aportacion_economica/text()', datos))[1]::text::numeric) AS total_aportes
FROM peliculas_completo_xml
WHERE xpath('//productor/text()', datos)::text = '{Franco Cristaldi}';

-- D) Listado de críticas recibidas por "Cinema Paradiso" dirigido por "Giuseppe Tornatore"
-- entre 1990-08-15 y 1990-08-30 ordenadas por fecha descendente
SELECT
  unnest(xpath('//critica/medio/text()', datos))::text AS medio,
  unnest(xpath('//critica/fecha/text()', datos))::text AS fecha,
  unnest(xpath('//critica/autor/text()', datos))::text AS autor
FROM peliculas_completo_xml
WHERE xpath('//nombre/text()', datos)::text = '{Cinema Paradiso}'
  AND xpath('//director/text()', datos)::text = '{Giuseppe Tornatore}'
  AND (xpath('//critica/fecha/text()', datos))[1]::date BETWEEN '1990-08-15' AND '1990-08-30'
ORDER BY fecha DESC;

-- E) Listado de todas las personas involucradas en "Cinema Paradiso"
-- mostrando nombre, rol, edad actual (aprox), estado civil y teléfono
-- NOTA: como esta info no está en XML, esta consulta es solo un ejemplo básico

SELECT
  'Salvatore Cascio' AS nombre,
  'Actor' AS rol,
  DATE_PART('year', AGE(CURRENT_DATE, DATE '1980-01-01')) AS edad,
  NULL::text AS estado_civil,
  NULL::text AS telefono
UNION ALL
SELECT
  (xpath('//director/text()', datos))[1]::text AS nombre,
  'Director' AS rol,
  NULL::int AS edad,
  NULL::text AS estado_civil,
  NULL::text AS telefono
FROM peliculas_completo_xml
WHERE xpath('//nombre/text()', datos)::text = '{Cinema Paradiso}';
