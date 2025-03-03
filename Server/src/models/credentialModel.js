const mongoose = require("mongoose");

const PasswordHistorySchema = new mongoose.Schema({
    oldPassword: { type: String, required: true },
    changeDate: { type: Date, default: Date.now },
    changeReason: { type: String }
});

const SecurityQuestionSchema = new mongoose.Schema({
    question: { type: String, required: true },
    answer: { type: String, required: true }
});

const NotificationSettingsSchema = new mongoose.Schema({
    passwordAccessed: { type: Boolean, default: false },
    passwordChanged: { type: Boolean, default: false },
    passwordLeaked: { type: Boolean, default: false }
});

const TrustedDeviceSchema = new mongoose.Schema({
    deviceId: { type: String, required: true },
    deviceName: { type: String, required: true },
    lastAccessed: { type: Date, default: Date.now }
});

const CredentialSchema = new mongoose.Schema({
    siteUrl: { type: String, required: true },
    emailId: { type: String, required: true },
    password: { type: String, required: true },
    userName: { type: String },
    phoneNumber: { type: String },
    userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
    isFavorite: { type: Boolean, default: false },
    passwordChangeReminder: { type: Number, default: 30 },
    passwordStrength: { type: String },
    isPasswordCompromised: { type: Boolean, default: false },
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now },
    lastPasswordChange: { type: Date, default: Date.now },
    passwordHistory: [PasswordHistorySchema],
    twoFactorAuthEnabled: { type: Boolean, default: false },
    securityQuestions: [SecurityQuestionSchema],
    notifications: { type: NotificationSettingsSchema, default: () => ({}) },
    trustedDevices: [TrustedDeviceSchema],
    backupEmail: { type: String },
    notes: { type: String },
    sharedWith: [{ type: mongoose.Schema.Types.ObjectId, ref: "User" }]
});

module.exports = mongoose.model("Credential", CredentialSchema);
