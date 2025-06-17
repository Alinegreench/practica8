const mongoose = require('../db');

const VarianteSchema = new mongoose.Schema({
  peso: String,
  precio: Number,
  stock: Number,
  codigo_barras: String
}, { _id: false });

const ProductoSchema = new mongoose.Schema({
  nombre: { type: String, required: true },
  descripcion: String,
  categoria_id: String,
  proveedor_id: String,
  variantes: [VarianteSchema],
  ingredientes: [String],
  razas_recomendadas: [String]
});

module.exports = mongoose.model('Producto', ProductoSchema);
