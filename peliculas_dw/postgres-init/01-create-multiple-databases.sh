#!/bin/bash
set -e

# Crear las bases de datos
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE peliculas_estrella;
    CREATE DATABASE peliculas_objetual;
    CREATE DATABASE peliculas_xml;
EOSQL

# Ejecutar el script XML después de crear las bases
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "peliculas_xml" -f /docker-entrypoint-initdb.d/03-modelo-xml.sql