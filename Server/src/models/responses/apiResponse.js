class ApiResponse {
    constructor({ isError = false, message = "", data = null, statusCode = 200 }) {
        this.isError = isError;
        this.message = message;
        this.data = data;
        this.statusCode = statusCode;
    }

    static success(message, data = null, statusCode = 200) {
        return new ApiResponse({ isError: false, message, data, statusCode });
    }

    static error(message, statusCode = 500) {
        return new ApiResponse({ isError: true, message, data: null, statusCode });
    }
}

module.exports = ApiResponse;
