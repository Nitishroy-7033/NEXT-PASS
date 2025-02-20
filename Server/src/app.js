const express = require('express');
const dotenv = require('dotenv');
const connectDB = require('./config/db');
const userRoutes = require('./routes/userRoutes');
const logger = require('./utils/logger');
const errorHandler = require('./middlewares/errorHandler');

dotenv.config();
connectDB();

const app = express();
app.use(express.json());

app.use(errorHandler); 
app.use('/api', userRoutes);

app.listen(process.env.PORT, () => {
    logger.info(`🚀 Next-pass Server running on port http://localhost:${process.env.PORT}`);
});
