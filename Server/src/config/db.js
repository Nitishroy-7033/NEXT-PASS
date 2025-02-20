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
    logger.info("✅ MongoDB connected successfully ");
    console.log("✅ MongoDB connected successfully");
  } catch (error) {
    console.error("❌ Error connecting to MongoDB", error);
    logger.error("❌ Error connecting to MongoDB", error);
  }
};

module.exports = connectDB;
