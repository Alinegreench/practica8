const mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI + 'perrishop?authSource=admin')
  .then(() => console.log('MongoDB conectado'))
  .catch(err => console.error('Error al conectar MongoDB:', err));

module.exports = mongoose;
