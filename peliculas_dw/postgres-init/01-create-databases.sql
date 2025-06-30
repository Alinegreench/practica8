-- Script: postgres-init/01-create-databases.sql
-- Crea las 3 bases de datos y ejecuta los scripts correspondientes

-- Crear las bases de datos
CREATE DATABASE peliculas_estrella;
CREATE DATABASE peliculas_objetual;
CREATE DATABASE peliculas_xml;

-- Ejecutar script XML en la base correspondiente
\c peliculas_xml
SET client_min_messages TO NOTICE;
\i /docker-entrypoint-initdb.d/03-modelo-xml.sql

-- Opcional: mensaje de confirmación
DO $$
BEGIN
    RAISE NOTICE 'Todas las bases de datos y esquemas configurados correctamente';
END $$;