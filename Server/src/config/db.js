const mongoose = require("mongoose");
const dotenv = require("dotenv");
const logger = require("../utils/logger");

dotenv.config();

const connectDB = async () => {
  console.log("♻️ Connecting to MongoDB...");
  try {
    await mongoose.connect(process.env.MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });

    const dbName = mongoose.connection.db.databaseName; // Get DB Name
    logger.info(`✅ MongoDB connected successfully to database: ${dbName}`);
    console.log(`✅ MongoDB connected successfully to database: ${dbName}`);
  } catch (error) {
    console.error("❌ Error connecting to MongoDB", error);
    logger.error("❌ Error connecting to MongoDB", error);
    process.exit(1); // Exit process if connection fails
  }
};

module.exports = connectDB;
