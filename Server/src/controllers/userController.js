const userService = require('../services/userService');
const ApiResponse = require('../models/responses/apiResponse');
const logger = require('../utils/logger');

exports.getAllUsers = async (req, res) => {
    try {
        const users = await userService.getAllUsers();
        logger.info('Fetched all users successfully');
        res.status(200).json(ApiResponse.success("Users fetched successfully", users));
    } catch (error) {
        logger.error(`Error fetching users: ${error.message}`);
        res.status(500).json(ApiResponse.error("Failed to fetch users"));
    }
};
