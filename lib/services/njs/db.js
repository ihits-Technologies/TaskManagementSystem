const mongoose = require('mongoose');
const connectionString = 'dbname'; // replace mongodb connection string

mongoose.connect(connectionString, {
useNewUrlParser: true,
useUnifiedTopology: true
})
.then(() => console.log('MongoDB connected successfully')).catch(error => console.error('MongoDB connection error:', error));

module.experts = mongoose;