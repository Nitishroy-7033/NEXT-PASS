const User = require('../models/user');
const bcrypt = require('bcryptjs');

exports.getAllUsers = async (filters) => {
    const query = {};

    if (filters.email) query.email = filters.email;
    if (filters.userName) query.userName = filters.userName;
    if (filters.phoneNumber) query.phoneNumber = filters.phoneNumber;
    if (filters.id) query._id = filters.id;

    return await User.find(query);
};

exports.createUser = async (userRequestDto) => {
    // Check if user already exists
    const existingUser = await User.findOne({ email: userRequestDto.email });
    if (existingUser) throw new Error("User already exists with this email");

    // Hash Password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(userRequestDto.password, salt);

    // Map DTO to User Model
    const user = new User({
        firstName: userRequestDto.firstName,
        lastName: userRequestDto.lastName,
        email: userRequestDto.email,
        userName: userRequestDto.userName,
        phoneNumber: userRequestDto.phoneNumber,
        hashedPassword,
        salt
    });

    // Save User to DB
    await user.save();
    return user;
};
exports.updateUser = async (id, userData) => {
    const user = await User.findByIdAndUpdate(id, userData, { new: true });
    if (!user) throw new Error("User not found");
    return user;
};

exports.deleteUser = async (id) => {
    const user = await User.findByIdAndDelete(id);
    if (!user) throw new Error("User not found");
    return user;
};

exports.createAdminUser = async (userData) => {
    userData.role = "admin";
    return await this.createUser(userData);
};
