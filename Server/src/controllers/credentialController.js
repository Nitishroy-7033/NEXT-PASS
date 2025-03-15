const Credential = require("../models/credentialModel.js");
const bcrypt = require("bcryptjs");
const ApiResponse = require("../models/responses/apiResponse.js"); 

exports.createCredential = async (req, res) => {
    try {
        const { password, ...rest } = req.body;
        console.log(req.body);

        // Hash the password before saving
        const hashedPassword = await bcrypt.hash(password, 10);

        const newCredential = new Credential({
            ...rest,
            password: hashedPassword
        });

        await newCredential.save();
        res.status(201).json(ApiResponse.success("Credential saved successfully",newCredential));
    } catch (error) {
        res.status(500).json(ApiResponse.error(error.message));
    }
};

// Get all credentials for a user
exports.getUserCredentials = async (req, res) => {
    try {
        const userId = req.user.id; // Assuming authentication middleware adds user to req
        const credentials = await Credential.find({ userId });
        res.status(200).json(ApiResponse.success("Credentials fetched successfully",credentials));
    } catch (error) {
        res.status(500).json(ApiResponse.error(error.message));
    }
};




// Search a single credential from a id
exports.getCredentialById = async (req, res) => {
    try {
        const { id } = req.params;
        const credential = await Credential.findById(id);
        if (!credential) 
            return res.status(404).json(ApiResponse.error("Credential not found",error.message));

        res.status(200).json(ApiResponse.success("Credential fetched successfully",credential))
    } catch (error) {
        res.status(500).json(ApiResponse.error(error.message));
    }
};

//update a credential
exports.updateCredential = async (req, res) => {
    try {
        const { id } = req.params;
        let { password, ...updates } = req.body;

        const credential = await Credential.findById(id);
        if (!credential) 
        return res.status(404).json(ApiResponse.error("Credential not found"));

        // If password is updated, hash it and store in history
        if (password) {
            const hashedPassword = await bcrypt.hash(password, 10);
            updates.password = hashedPassword;
            
            credential.passwordHistory.push({
                oldPassword: credential.password,
                changeDate: new Date(),
                changeReason: "User changed password" // Can customize reason
            });

            credential.lastPasswordChange = new Date();
        }

        Object.assign(credential, updates);
        credential.updatedAt = new Date();
        await credential.save();

        res.status(200).json(ApiResponse.success("Credential updated successfully",credential));
    } catch (error) {
        res.status(500).json(ApiResponse.error(error.message));
    }
};

// Delete a credential
exports.deleteCredential = async (req, res) => {
    try {
        const { id } = req.params;
        const credential = await Credential.findByIdAndDelete(id);
        if (!credential) 
        return res.status(404).json(ApiResponse.error("Credential not found"));

        res.status(200).json(ApiResponse.success("Credential deleted successfully"));
    } catch (error) {
        res.status(500).json(ApiResponse.error(error.message));
    }
};