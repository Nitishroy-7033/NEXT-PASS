const ApiResponse = require('../models/responses/apiResponse');
const logger = require('../utils/logger');

const errorHandler = (err, req, res, next) => {
    logger.error(`Error: ${err.message} - ${req.method} ${req.url}`);
    res.status(err.statusCode || 500).json(ApiResponse.error(err.message || "Internal Server Error", err.statusCode || 500));
};

module.exports = errorHandler;
