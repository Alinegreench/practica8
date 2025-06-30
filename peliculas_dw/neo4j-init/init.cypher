CREATE CONSTRAINT pelicula_nombre IF NOT EXISTS FOR (p:Pelicula) REQUIRE p.nombre IS UNIQUE;
CREATE CONSTRAINT actor_nombre IF NOT EXISTS FOR (a:Actor) REQUIRE a.nombre IS UNIQUE;
CREATE CONSTRAINT director_nombre IF NOT EXISTS FOR (d:Director) REQUIRE d.nombre IS UNIQUE;
CREATE CONSTRAINT productor_nombre IF NOT EXISTS FOR (p:Productor) REQUIRE p.nombre IS UNIQUE;
CREATE CONSTRAINT premio_nombre IF NOT EXISTS FOR (pr:Premio) REQUIRE pr.nombre IS UNIQUE;
CREATE CONSTRAINT critica_id IF NOT EXISTS FOR (c:Critica) REQUIRE c.id IS UNIQUE;

CREATE (p1:Pelicula {
    nombre: 'Cinema Paradiso',
    resumen: 'Una emotiva historia sobre un niño que crece en un pequeño pueblo siciliano y su amistad con el proyeccionista del cine local.',
    fecha_estreno: date('1988-11-17'),
    ranking: 4.8
});
CREATE (p2:Pelicula {
    nombre: 'La vida es bella',
    resumen: 'Durante la Segunda Guerra Mundial, un padre judío italiano usa su imaginación y humor para proteger a su hijo de los horrores del campo de concentración.',
    fecha_estreno: date('1997-12-20'),
    ranking: 4.9
});
CREATE (p3:Pelicula {
    nombre: 'El Padrino',
    resumen: 'La épica saga de la familia Corleone, una poderosa dinastía de la mafia italoamericana.',
    fecha_estreno: date('1972-03-24'),
    ranking: 4.7
});
CREATE (p4:Pelicula {
    nombre: 'Casablanca',
    resumen: 'En el Casablanca de la Segunda Guerra Mundial, el cínico dueño de un café se debate entre el amor y la virtud.',
    fecha_estreno: date('1942-11-26'),
    ranking: 4.6
});
CREATE (p5:Pelicula {
    nombre: 'Titanic',
    resumen: 'Una historia de amor épica entre Jack y Rose a bordo del fatídico viaje inaugural del RMS Titanic.',
    fecha_estreno: date('1997-12-19'),
    ranking: 4.4
});
CREATE (p6:Pelicula {
    nombre: 'Forrest Gump',
    resumen: 'La extraordinaria vida de Forrest Gump, quien sin proponérselo se convierte en testigo de momentos cruciales de la historia.',
    fecha_estreno: date('1994-07-06'),
    ranking: 4.5
});
CREATE (p7:Pelicula {
    nombre: 'Pulp Fiction',
    resumen: 'Múltiples historias criminales se entrelazan en Los Ángeles con diálogos ingeniosos.',
    fecha_estreno: date('1994-10-14'),
    ranking: 4.3
});
CREATE (p8:Pelicula {
    nombre: 'El Rey León',
    resumen: 'Simba, un joven león príncipe, debe reclamar su lugar como rey después de la muerte de su padre.',
    fecha_estreno: date('1994-06-24'),
    ranking: 4.2
});
CREATE (a1:Actor {
    nombre: 'Salvatore Cascio',
    estado_civil: 'Soltero',
    telefono: '5551234567',
    fecha_nacimiento: date('1980-01-01')
});
CREATE (a2:Actor {
    nombre: 'Roberto Benigni',
    estado_civil: 'Casado',
    telefono: '5557654321',
    fecha_nacimiento: date('1952-10-27')
});
CREATE (a3:Actor {
    nombre: 'Marlon Brando',
    estado_civil: 'Divorciado',
    telefono: '5551111111',
    fecha_nacimiento: date('1924-04-03')
});
CREATE (a4:Actor {
    nombre: 'Humphrey Bogart',
    estado_civil: 'Viudo',
    telefono: '5552222222',
    fecha_nacimiento: date('1899-12-25')
});
CREATE (a5:Actor {
    nombre: 'Leonardo DiCaprio',
    estado_civil: 'Soltero',
    telefono: '5553333333',
    fecha_nacimiento: date('1974-11-11')
});
CREATE (a6:Actor {
    nombre: 'Tom Hanks',
    estado_civil: 'Casado',
    telefono: '5554444444',
    fecha_nacimiento: date('1956-07-09')
});
CREATE (a7:Actor {
    nombre: 'John Travolta',
    estado_civil: 'Casado',
    telefono: '5555555555',
    fecha_nacimiento: date('1954-02-18')
});
CREATE (a8:Actor {
    nombre: 'Matthew Broderick',
    estado_civil: 'Union libre',
    telefono: '5556666666',
    fecha_nacimiento: date('1962-03-21')
});
CREATE (d1:Director {nombre: 'Giuseppe Tornatore'});
CREATE (d2:Director {nombre: 'Roberto Benigni'});
CREATE (d3:Director {nombre: 'Francis Ford Coppola'});
CREATE (d4:Director {nombre: 'Michael Curtiz'});
CREATE (d5:Director {nombre: 'James Cameron'});
CREATE (d6:Director {nombre: 'Robert Zemeckis'});
CREATE (d7:Director {nombre: 'Quentin Tarantino'});
CREATE (d8:Director {nombre: 'Roger Allers'});
CREATE (pr1:Productor {nombre: 'Franco Cristaldi'});
CREATE (pr2:Productor {nombre: 'Elda Ferri'});
CREATE (pr3:Productor {nombre: 'Albert S. Ruddy'});
CREATE (pr4:Productor {nombre: 'Hal B. Wallis'});
CREATE (pr5:Productor {nombre: 'James Cameron'});
CREATE (pr6:Productor {nombre: 'Wendy Finerman'});
CREATE (pr7:Productor {nombre: 'Lawrence Bender'});
CREATE (pr8:Productor {nombre: 'Don Hahn'});
CREATE (premio1:Premio {
    nombre: 'Oscar',
    lugar_certamen: 'Los Angeles',
    tipo_certamen: 'Internacional',
    fecha: date('1990-03-25'),
    autor: 'Academia'
});
CREATE (premio2:Premio {
    nombre: 'Cannes',
    lugar_certamen: 'Francia',
    tipo_certamen: 'Internacional',
    fecha: date('1998-05-15'),
    autor: 'Festival Cannes'
});
CREATE (premio3:Premio {
    nombre: 'Globo de Oro',
    lugar_certamen: 'Beverly Hills',
    tipo_certamen: 'Internacional',
    fecha: date('1973-01-28'),
    autor: 'HFPA'
});
CREATE (premio4:Premio {
    nombre: 'BAFTA',
    lugar_certamen: 'Londres',
    tipo_certamen: 'Internacional',
    fecha: date('1943-04-10'),
    autor: 'Academia Britanica'
});
CREATE (premio5:Premio {
    nombre: 'Premio Goya',
    lugar_certamen: 'Madrid',
    tipo_certamen: 'Nacional',
    fecha: date('1998-02-14'),
    autor: 'Academia Española'
});
CREATE (premio6:Premio {
    nombre: 'SAG Award',
    lugar_certamen: 'Los Angeles',
    tipo_certamen: 'Internacional',
    fecha: date('1995-02-25'),
    autor: 'SAG'
});
CREATE (premio7:Premio {
    nombre: 'Palma de Oro',
    lugar_certamen: 'Cannes',
    tipo_certamen: 'Internacional',
    fecha: date('1994-05-23'),
    autor: 'Festival Cannes'
});
CREATE (premio8:Premio {
    nombre: 'Annie Award',
    lugar_certamen: 'Los Angeles',
    tipo_certamen: 'Internacional',
    fecha: date('1995-03-18'),
    autor: 'ASIFA'
});
CREATE (c1:Critica {
    id: 1,
    medio: 'El Universal',
    fecha: date('1990-08-20'),
    autor: 'Juan Pérez'
});
CREATE (c2:Critica {
    id: 2,
    medio: 'Le Monde',
    fecha: date('1998-01-15'),
    autor: 'Claire Dubois'
});
CREATE (c3:Critica {
    id: 3,
    medio: 'The New York Times',
    fecha: date('1972-05-20'),
    autor: 'Vincent Canby'
});
CREATE (c4:Critica {
    id: 4,
    medio: 'Variety',
    fecha: date('1943-03-05'),
    autor: 'Abel Green'
});
CREATE (c5:Critica {
    id: 5,
    medio: 'Rolling Stone',
    fecha: date('1998-03-15'),
    autor: 'Peter Travers'
});
CREATE (c6:Critica {
    id: 6,
    medio: 'Entertainment Weekly',
    fecha: date('1994-09-15'),
    autor: 'Owen Gleiberman'
});
CREATE (c7:Critica {
    id: 7,
    medio: 'The Guardian',
    fecha: date('1995-02-10'),
    autor: 'Derek Malcolm'
});
CREATE (c8:Critica {
    id: 8,
    medio: 'Los Angeles Times',
    fecha: date('1994-08-25'),
    autor: 'Kenneth Turan'
});
// Relaciones ACTUA_EN
MATCH (a:Actor {nombre: 'Salvatore Cascio'}), (p:Pelicula {nombre: 'Cinema Paradiso'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 700000.00}]->(p);

MATCH (a:Actor {nombre: 'Roberto Benigni'}), (p:Pelicula {nombre: 'La vida es bella'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 900000.00}]->(p);

MATCH (a:Actor {nombre: 'Marlon Brando'}), (p:Pelicula {nombre: 'El Padrino'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 1200000.00}]->(p);

MATCH (a:Actor {nombre: 'Humphrey Bogart'}), (p:Pelicula {nombre: 'Casablanca'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 650000.00}]->(p);

MATCH (a:Actor {nombre: 'Leonardo DiCaprio'}), (p:Pelicula {nombre: 'Titanic'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 2500000.00}]->(p);

MATCH (a:Actor {nombre: 'Tom Hanks'}), (p:Pelicula {nombre: 'Forrest Gump'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 1800000.00}]->(p);

MATCH (a:Actor {nombre: 'John Travolta'}), (p:Pelicula {nombre: 'Pulp Fiction'})
CREATE (a)-[:ACTUA_EN {tipo: 'Protagonista', salario: 1500000.00}]->(p);

MATCH (a:Actor {nombre: 'Matthew Broderick'}), (p:Pelicula {nombre: 'El Rey León'})
CREATE (a)-[:ACTUA_EN {tipo: 'Secundario', salario: 2000000.00}]->(p);

// Relaciones DIRIGE
MATCH (d:Director {nombre: 'Giuseppe Tornatore'}), (p:Pelicula {nombre: 'Cinema Paradiso'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'Roberto Benigni'}), (p:Pelicula {nombre: 'La vida es bella'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'Francis Ford Coppola'}), (p:Pelicula {nombre: 'El Padrino'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'Michael Curtiz'}), (p:Pelicula {nombre: 'Casablanca'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'James Cameron'}), (p:Pelicula {nombre: 'Titanic'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'Robert Zemeckis'}), (p:Pelicula {nombre: 'Forrest Gump'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'Quentin Tarantino'}), (p:Pelicula {nombre: 'Pulp Fiction'})
CREATE (d)-[:DIRIGE]->(p);

MATCH (d:Director {nombre: 'Roger Allers'}), (p:Pelicula {nombre: 'El Rey León'})
CREATE (d)-[:DIRIGE]->(p);

// Relaciones PRODUCE
MATCH (pr:Productor {nombre: 'Franco Cristaldi'}), (p:Pelicula {nombre: 'Cinema Paradiso'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 1000000.00}]->(p);

MATCH (pr:Productor {nombre: 'Elda Ferri'}), (p:Pelicula {nombre: 'La vida es bella'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 2000000.00}]->(p);

MATCH (pr:Productor {nombre: 'Albert S. Ruddy'}), (p:Pelicula {nombre: 'El Padrino'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 5000000.00}]->(p);

MATCH (pr:Productor {nombre: 'Hal B. Wallis'}), (p:Pelicula {nombre: 'Casablanca'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 800000.00}]->(p);

MATCH (pr:Productor {nombre: 'James Cameron'}), (p:Pelicula {nombre: 'Titanic'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 15000000.00}]->(p);

MATCH (pr:Productor {nombre: 'Wendy Finerman'}), (p:Pelicula {nombre: 'Forrest Gump'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 3500000.00}]->(p);

MATCH (pr:Productor {nombre: 'Lawrence Bender'}), (p:Pelicula {nombre: 'Pulp Fiction'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 2800000.00}]->(p);

MATCH (pr:Productor {nombre: 'Don Hahn'}), (p:Pelicula {nombre: 'El Rey León'})
CREATE (pr)-[:PRODUCE {aportacion_economica: 4200000.00}]->(p);

// Relaciones RECIBE_PREMIO
MATCH (p:Pelicula {nombre: 'Cinema Paradiso'}), (pr:Premio {nombre: 'Oscar'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1990-03-25')}]->(pr);

MATCH (p:Pelicula {nombre: 'La vida es bella'}), (pr:Premio {nombre: 'Cannes'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1998-05-15')}]->(pr);

MATCH (p:Pelicula {nombre: 'El Padrino'}), (pr:Premio {nombre: 'Globo de Oro'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1973-01-28')}]->(pr);

MATCH (p:Pelicula {nombre: 'Casablanca'}), (pr:Premio {nombre: 'BAFTA'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1943-04-10')}]->(pr);

MATCH (p:Pelicula {nombre: 'Titanic'}), (pr:Premio {nombre: 'Premio Goya'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1998-02-14')}]->(pr);

MATCH (p:Pelicula {nombre: 'Forrest Gump'}), (pr:Premio {nombre: 'SAG Award'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1995-02-25')}]->(pr);

MATCH (p:Pelicula {nombre: 'Pulp Fiction'}), (pr:Premio {nombre: 'Palma de Oro'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1994-05-23')}]->(pr);

MATCH (p:Pelicula {nombre: 'El Rey León'}), (pr:Premio {nombre: 'Annie Award'})
CREATE (p)-[:RECIBE_PREMIO {fecha_otorgamiento: date('1995-03-18')}]->(pr);

// Relaciones RECIBE_CRITICA
MATCH (p:Pelicula {nombre: 'Cinema Paradiso'}), (c:Critica {id: 1})
CREATE (p)-[:RECIBE_CRITICA]->(c);

MATCH (p:Pelicula {nombre: 'La vida es bella'}), (c:Critica {
