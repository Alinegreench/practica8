// Cambiar a la base de datos peliculas_json
db = db.getSiblingDB('peliculas_json');

// Eliminar colección si existe
db.peliculas.drop();

// Crear colección sin validación por ahora
db.createCollection("peliculas");

print("Insertando películas...");

// Insertar datos de las 8 películas
db.peliculas.insertMany([
  {
    nombre: "Cinema Paradiso",
    resumen: "Una gran película sobre un niño que crece en un pequeño pueblo siciliano y su amistad con el proyeccionista del cine local",
    fecha_estreno: new Date("1988-11-17"),
    participaciones: [{
        actor: {
            nombre: "Salvatore Cascio",
            estado_civil: "Soltero",
            telefono: "5551234567",
            fecha_nacimiento: new Date("1980-01-01")
        },
        director: { nombre: "Giuseppe Tornatore" },
        productor: { nombre: "Franco Cristaldi" },
        fecha: { ano: NumberInt(1990), mes: NumberInt(8), dia: NumberInt(20) },
        premio: {
            nombre: "Oscar",
            lugar_certamen: "Los Angeles",
            tipo_certamen: "Internacional",
            fecha: new Date("1990-03-25"),
            autor: "Academia"
        },
        critica: {
            medio: "El Universal",
            fecha: new Date("1990-08-20"),
            autor: "Juan Pérez"
        },
        aportacion_economica: 1000000.00,
        salario: 700000.00,
        ranking: 4.8
    }]
  },
  {
    nombre: "La vida es bella",
    resumen: "Durante la Segunda Guerra Mundial, un padre judío italiano usa su imaginación para proteger a su hijo de los horrores del campo de concentración",
    fecha_estreno: new Date("1997-12-20"),
    participaciones: [{
        actor: {
            nombre: "Roberto Benigni",
            estado_civil: "Casado",
            telefono: "5557654321",
            fecha_nacimiento: new Date("1952-10-27")
        },
        director: { nombre: "Roberto Benigni" },
        productor: { nombre: "Elda Ferri" },
        fecha: { ano: NumberInt(1998), mes: NumberInt(1), dia: NumberInt(10) },
        premio: {
            nombre: "Cannes",
            lugar_certamen: "Francia",
            tipo_certamen: "Internacional",
            fecha: new Date("1998-05-15"),
            autor: "Festival Cannes"
        },
        critica: {
            medio: "Le Monde",
            fecha: new Date("1998-01-15"),
            autor: "Claire Dubois"
        },
        aportacion_economica: 2000000.00,
        salario: 900000.00,
        ranking: 4.9
    }]
  },
  {
    nombre: "El Padrino",
    resumen: "La épica saga de la familia Corleone, una poderosa dinastía de la mafia italoamericana liderada por Don Vito Corleone",
    fecha_estreno: new Date("1972-03-24"),
    participaciones: [{
        actor: {
            nombre: "Marlon Brando",
            estado_civil: "Divorciado",
            telefono: "5551111111",
            fecha_nacimiento: new Date("1924-04-03")
        },
        director: { nombre: "Francis Ford Coppola" },
        productor: { nombre: "Albert S. Ruddy" },
        fecha: { ano: NumberInt(1972), mes: NumberInt(5), dia: NumberInt(15) },
        premio: {
            nombre: "Globo de Oro",
            lugar_certamen: "Beverly Hills",
            tipo_certamen: "Internacional",
            fecha: new Date("1973-01-28"),
            autor: "HFPA"
        },
        critica: {
            medio: "The New York Times",
            fecha: new Date("1972-05-20"),
            autor: "Vincent Canby"
        },
        aportacion_economica: 5000000.00,
        salario: 1200000.00,
        ranking: 4.7
    }]
  },
  {
    nombre: "Casablanca",
    resumen: "En el Casablanca de la Segunda Guerra Mundial, el dueño de un café se debate entre el amor y la virtud cuando aparece su antigua amante",
    fecha_estreno: new Date("1942-11-26"),
    participaciones: [{
        actor: {
            nombre: "Humphrey Bogart",
            estado_civil: "Viudo",
            telefono: "5552222222",
            fecha_nacimiento: new Date("1899-12-25")
        },
        director: { nombre: "Michael Curtiz" },
        productor: { nombre: "Hal B. Wallis" },
        fecha: { ano: NumberInt(1943), mes: NumberInt(2), dia: NumberInt(28) },
        premio: {
            nombre: "BAFTA",
            lugar_certamen: "Londres",
            tipo_certamen: "Internacional",
            fecha: new Date("1943-04-10"),
            autor: "Academia Britanica"
        },
        critica: {
            medio: "Variety",
            fecha: new Date("1943-03-05"),
            autor: "Abel Green"
        },
        aportacion_economica: 800000.00,
        salario: 650000.00,
        ranking: 4.6
    }]
  },
  {
    nombre: "Titanic",
    resumen: "Una historia de amor épica entre Jack y Rose a bordo del fatídico viaje inaugural del RMS Titanic en 1912",
    fecha_estreno: new Date("1997-12-19"),
    participaciones: [{
        actor: {
            nombre: "Leonardo DiCaprio",
            estado_civil: "Soltero",
            telefono: "5553333333",
            fecha_nacimiento: new Date("1974-11-11")
        },
        director: { nombre: "James Cameron" },
        productor: { nombre: "James Cameron" },
        fecha: { ano: NumberInt(1998), mes: NumberInt(3), dia: NumberInt(12) },
        premio: {
            nombre: "Premio Goya",
            lugar_certamen: "Madrid",
            tipo_certamen: "Nacional",
            fecha: new Date("1998-02-14"),
            autor: "Academia Española"
        },
        critica: {
            medio: "Rolling Stone",
            fecha: new Date("1998-03-15"),
            autor: "Peter Travers"
        },
        aportacion_economica: 15000000.00,
        salario: 2500000.00,
        ranking: 4.4
    }]
  },
  {
    nombre: "Forrest Gump",
    resumen: "La extraordinaria vida de Forrest Gump, quien sin proponérselo se convierte en testigo de momentos cruciales de la historia estadounidense",
    fecha_estreno: new Date("1994-07-06"),
    participaciones: [{
        actor: {
            nombre: "Tom Hanks",
            estado_civil: "Casado",
            telefono: "5554444444",
            fecha_nacimiento: new Date("1956-07-09")
        },
        director: { nombre: "Robert Zemeckis" },
        productor: { nombre: "Wendy Finerman" },
        fecha: { ano: NumberInt(1994), mes: NumberInt(9), dia: NumberInt(8) },
        premio: {
            nombre: "SAG Award",
            lugar_certamen: "Los Angeles",
            tipo_certamen: "Internacional",
            fecha: new Date("1995-02-25"),
            autor: "SAG"
        },
        critica: {
            medio: "Entertainment Weekly",
            fecha: new Date("1994-09-15"),
            autor: "Owen Gleiberman"
        },
        aportacion_economica: 3500000.00,
        salario: 1800000.00,
        ranking: 4.5
    }]
  },
  {
    nombre: "Pulp Fiction",
    resumen: "Múltiples historias criminales se entrelazan en Los Ángeles con diálogos ingeniosos y una narrativa no lineal única",
    fecha_estreno: new Date("1994-10-14"),
    participaciones: [{
        actor: {
            nombre: "John Travolta",
            estado_civil: "Casado",
            telefono: "5555555555",
            fecha_nacimiento: new Date("1954-02-18")
        },
        director: { nombre: "Quentin Tarantino" },
        productor: { nombre: "Lawrence Bender" },
        fecha: { ano: NumberInt(1995), mes: NumberInt(1), dia: NumberInt(25) },
        premio: {
            nombre: "Palma de Oro",
            lugar_certamen: "Cannes",
            tipo_certamen: "Internacional",
            fecha: new Date("1994-05-23"),
            autor: "Festival Cannes"
        },
        critica: {
            medio: "The Guardian",
            fecha: new Date("1995-02-10"),
            autor: "Derek Malcolm"
        },
        aportacion_economica: 2800000.00,
        salario: 1500000.00,
        ranking: 4.3
    }]
  },
  {
    nombre: "El Rey León",
    resumen: "Simba, un joven león príncipe, debe reclamar su lugar como rey después de la muerte de su padre y enfrentar a su malvado tío Scar",
    fecha_estreno: new Date("1994-06-24"),
    participaciones: [{
        actor: {
            nombre: "Matthew Broderick",
            estado_civil: "Union libre",
            telefono: "5556666666",
            fecha_nacimiento: new Date("1962-03-21")
        },
        director: { nombre: "Roger Allers" },
        productor: { nombre: "Don Hahn" },
        fecha: { ano: NumberInt(1994), mes: NumberInt(8), dia: NumberInt(18) },
        premio: {
            nombre: "Annie Award",
            lugar_certamen: "Los Angeles",
            tipo_certamen: "Internacional",
            fecha: new Date("1995-03-18"),
            autor: "ASIFA"
        },
        critica: {
            medio: "Los Angeles Times",
            fecha: new Date("1994-08-25"),
            autor: "Kenneth Turan"
        },
        aportacion_economica: 4200000.00,
        salario: 2000000.00,
        ranking: 4.2
    }]
  }
]);

print("Películas insertadas: " + db.peliculas.countDocuments());

// CONSULTAS DE NEGOCIO

print("\n=== CONSULTA A: Total salarios Cinema Paradiso ===");
db.peliculas.aggregate([
  { $match: { nombre: "Cinema Paradiso" } },
  { $unwind: "$participaciones" },
  { $match: { "participaciones.director.nombre": "Giuseppe Tornatore" } },
  { $group: {
      _id: null,
      pelicula: { $first: "$nombre" },
      director: { $first: "$participaciones.director.nombre" },
      actor: { $first: "$participaciones.actor.nombre" },
      salario: { $first: "$participaciones.salario" },
      total_salarios: { $sum: "$participaciones.salario" }
  }},
  { $project: {
      _id: 0,
      pelicula: 1,
      director: 1,
      actor: 1,
      salario: 1,
      total_salarios: 1
  }}
]).forEach(printjson);

print("\n=== CONSULTA B: Premios Cinema Paradiso ===");
db.peliculas.aggregate([
  { $match: { nombre: "Cinema Paradiso" } },
  { $unwind: "$participaciones" },
  { $match: { "participaciones.director.nombre": "Giuseppe Tornatore" } },
  { $project: {
      _id: 0,
      pelicula: "$nombre",
      ranking: "$participaciones.ranking",
      premio: "$participaciones.premio.nombre",
      lugar_certamen: "$participaciones.premio.lugar_certamen",
      tipo_certamen: "$participaciones.premio.tipo_certamen",
      fecha_premio: "$participaciones.premio.fecha"
  }},
  { $sort: { ranking: -1 } }
]).forEach(printjson);

print("\n=== CONSULTA C: Aportes Franco Cristaldi ===");
db.peliculas.aggregate([
  { $unwind: "$participaciones" },
  { $match: { "participaciones.productor.nombre": "Franco Cristaldi" } },
  { $group: {
      _id: null,
      productor: { $first: "$participaciones.productor.nombre" },
      peliculas_producidas: { $sum: 1 },
      total_aportes: { $sum: "$participaciones.aportacion_economica" }
  }},
  { $project: {
      _id: 0,
      productor: 1,
      peliculas_producidas: 1,
      total_aportes: 1
  }}
]).forEach(printjson);

print("\n=== CONSULTA D: Críticas Cinema Paradiso ===");
db.peliculas.aggregate([
  { $match: { nombre: "Cinema Paradiso" } },
  { $unwind: "$participaciones" },
  { $match: { 
      "participaciones.director.nombre": "Giuseppe Tornatore",
      "participaciones.critica.fecha": {
        $gte: new Date("1990-08-15"),
        $lte: new Date("1990-08-30")
      }
  }},
  { $project: {
      _id: 0,
      pelicula: "$nombre",
      medio: "$participaciones.critica.medio",
      fecha_critica: "$participaciones.critica.fecha",
      autor: "$participaciones.critica.autor",
      ranking: "$participaciones.ranking"
  }},
  { $sort: { fecha_critica: -1 } }
]).forEach(printjson);

print("\n=== CONSULTA E: Personas en Cinema Paradiso ===");
db.peliculas.aggregate([
  { $match: { nombre: "Cinema Paradiso" } },
  { $unwind: "$participaciones" },
  { $project: {
      personas: [
        { 
          rol: "Actor",
          nombre: "$participaciones.actor.nombre",
          edad_actual: { 
            $subtract: [
              { $year: new Date() },
              { $year: "$participaciones.actor.fecha_nacimiento" }
            ]
          },
          estado_civil: "$participaciones.actor.estado_civil",
          telefono: "$participaciones.actor.telefono"
        },
        { 
          rol: "Director",
          nombre: "$participaciones.director.nombre",
          edad_actual: null,
          estado_civil: null,
          telefono: null
        },
        { 
          rol: "Productor",
          nombre: "$participaciones.productor.nombre",
          edad_actual: null,
          estado_civil: null,
          telefono: null
        }
      ]
  }},
  { $unwind: "$personas" },
  { $replaceRoot: { newRoot: "$personas" } },
  { $sort: { rol: 1, nombre: 1 } }
]).forEach(printjson);

print("\n=== TODAS LAS CONSULTAS COMPLETADAS ===");