const LoginRequestDto = require("../models/requests/loginRequest");
const authService = require("../services/authService");
const ApiResponse = require("../models/responses/apiResponse"); 
const logger = require("../utils/logger");

// exports.register = async (req, res) => {
//     try {
//         const response = await authService.register(req.body);
//         res.status(201).json(ApiResponse.success("User registered successfully", response));
//     } catch (error) {
//         logger.error(`Registration Error: ${error.message}`);
//         res.status(400).json(ApiResponse.error(error.message));
//     }
// };

exports.login = async (req, res) => {
    try {
        const authRquest = new LoginRequestDto(req.body);
        const response = await authService.login(authRquest);
        res.status(200).json(ApiResponse.success("Login successful", response));
    } catch (error) {
        logger.error(`Login Error: ${error.message}`);
        res.status(400).json(ApiResponse.error(error.message));
    }
};
