const mongoose = require('../db');
bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

userSchema = new mongoose.Schema({
companyID: {
type: String,
required: true
},
UserId: {
type: String,
required: true
},
password: {
type: String,
required: true,
minlength:6
}
});
