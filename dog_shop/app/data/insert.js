const Producto = require('../models/producto');

const producto = new Producto({
  nombre: "Croquetas sabor salmón",
  descripcion: "Croquetas premium para perros adultos, sabor salmón",
  categoria_id: "cat001",
  proveedor_id: "prov001",
  variantes: [
    { peso: "1kg", precio: 150, stock: 20, codigo_barras: "1234567890" },
    { peso: "3kg", precio: 400, stock: 10, codigo_barras: "1234567891" }
  ],
  ingredientes: ["salmón", "arroz", "aceite de pescado"],
  razas_recomendadas: ["mediana", "grande"]
});

producto.save()
  .then(() => {
    console.log("Producto insertado exitosamente");
    process.exit();
  })
  .catch(err => {
    console.error("Error al insertar producto:", err);
    process.exit(1);
  });
