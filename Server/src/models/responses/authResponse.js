class AuthResponseDto {
    constructor({ user, accessToken, refreshToken,role }) {
        this.userName = user.userName;
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
        this.expiresIn = "1h"; // Token expiry time
        this.role;
    }
}

module.exports = AuthResponseDto;