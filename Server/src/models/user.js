const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    email: { type: String, required: true, unique: true },
    hashedPassword: { type: String, required: true },
    salt: { type: String, required: true },
    createdAt: { type: Date, default: Date.now },
    lastLogin: { type: Date, default: null },
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    userName: { type: String, required: true, unique: true },
    phoneNumber: { type: String, required: true, unique: true },
    isVerified: { type: Boolean, default: false },
    verificationDate: { type: Date, default: null },
    dateOfBirth: { type: Date, default: null },
    profilePicture: { type: String, default: null },
    updatedAt: { type: Date, default: Date.now },
    role: { type: String, enum: ['user', 'admin'], default: 'user' },
    isDeleted: { type: Boolean, default: false }
});

module.exports = mongoose.model('User', userSchema);
