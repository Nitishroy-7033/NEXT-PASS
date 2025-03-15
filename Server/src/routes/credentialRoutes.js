const express = require("express");
const router = express.Router();
const credentialController = require("../controllers/credentialController.js");
const {authenticateToken} = require("../middlewares/authMiddleware.js");

router.post("/new", credentialController.createCredential);
router.get("/", authenticateToken, credentialController.getUserCredentials);
router.get("/:id", authenticateToken, credentialController.getCredentialById);
router.put("/:id", authenticateToken, credentialController.updateCredential);
router.delete("/:id", authenticateToken, credentialController.deleteCredential);

module.exports =  router
