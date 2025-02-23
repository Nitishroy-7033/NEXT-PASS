const User = require("../models/user");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const LoginRequestDto = require("../models/requests/loginRequest");
const AuthResponseDto = require("../models/responses/authResponse");

// exports.register = async (userDto) => {
//     const userRequest = new RegisterRequestDto(userDto);

//     const existingUser = await User.findOne({ email: userRequest.email });
//     if (existingUser) throw new Error("User already exists with this email");

//     const salt = await bcrypt.genSalt(10);
//     const hashedPassword = await bcrypt.hash(userRequest.password, salt);

//     const user = new User({
//         ...userRequest,
//         hashedPassword,
//         salt
//     });

//     await user.save();

//     const tokens = generateTokens(user);
//     return new AuthResponseDto({ user, ...tokens });
// };

exports.login = async (authRequest) => {
    const user = await User.findOne({ email: authRequest.email });
    if (!user) throw new Error("Invalid email or password");

    const isMatch = await bcrypt.compare(authRequest.password, user.hashedPassword);
    if (!isMatch) throw new Error("Invalid email or password");

    const tokens = generateTokens(user);
    return new AuthResponseDto({ user, ...tokens });
};

const generateTokens = (user) => {
    const payload = {
        userId: user._id,
        userName: user.userName,
        email: user.email,
        role: user.role
    };

    const accessToken = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: process.env.JWT_EXPIRES_IN });
    const refreshToken = jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET, { expiresIn: "7d" });

    return { accessToken, refreshToken };
};
