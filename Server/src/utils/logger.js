const { createLogger, format, transports } = require('winston');
const path = require('path');

const logger = createLogger({
    level: 'info', // Log only info and above (warn, error)
    format: format.combine(
        format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        format.errors({ stack: true }),
        format.splat(),
        format.json()
    ),
    transports: [
        new transports.Console({
            format: format.combine(
                format.colorize(),
                format.printf(({ level, message, timestamp }) => `${timestamp} [${level}]: ${message}`)
            ),
        }),
        new transports.File({ filename: path.join(__dirname, '../../logs/error.log'), level: 'error' }),
        new transports.File({ filename: path.join(__dirname, '../../logs/combined.log') }),
    ],
});

module.exports = logger;
