const User = require('../models/user');

exports.getAllUsers = async () => {
    return await User.find();
};
