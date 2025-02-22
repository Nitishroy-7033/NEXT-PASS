const userService = require('../services/userService');
const ApiResponse = require('../models/responses/apiResponse');
const UserResponseDto = require('../models/responses/userResponseDto');
const UserRequestDto = require('../models/requests/UserRequestDto');
const logger = require('../utils/logger');

exports.getAllUsers = async (req, res) => {
    try {
        const filters = req.query;
        const users = await userService.getAllUsers(filters);
        const userDtos = users.map(user => new UserResponseDto(user));
        res.status(200).json(ApiResponse.success("Users fetched successfully", userDtos));
    } catch (error) {
        logger.error(`Error fetching users: ${error.message}`);
        res.status(500).json(ApiResponse.error("Failed to fetch users"));
    }
};

exports.createUser = async (req, res) => {
    try {
        const userRequest = new UserRequestDto(req.body);
        const user = await userService.createUser(userRequest);
        res.status(201).json(ApiResponse.success("User created successfully", new UserResponseDto(user)));
    } catch (error) {
        logger.error(`Error creating user: ${error.message}`);
        res.status(400).json(ApiResponse.error(error.message));
    }
};

exports.updateUser = async (req, res) => {
    try {
        const user = await userService.updateUser(req.params.id, req.body);
        res.status(200).json(ApiResponse.success("User updated successfully", new UserResponseDto(user)));
    } catch (error) {
        res.status(400).json(ApiResponse.error(error.message));
    }
};

exports.deleteUser = async (req, res) => {
    try {
        await userService.deleteUser(req.params.id);
        res.status(200).json(ApiResponse.success("User deleted successfully"));
    } catch (error) {
        res.status(400).json(ApiResponse.error(error.message));
    }
};

exports.createAdminUser = async (req, res) => {
    try {
        const adminUser = await userService.createAdminUser(req.body);
        res.status(201).json(ApiResponse.success("Admin user created successfully", new UserResponseDto(adminUser)));
    } catch (error) {
        res.status(400).json(ApiResponse.error(error.message));
    }
};
