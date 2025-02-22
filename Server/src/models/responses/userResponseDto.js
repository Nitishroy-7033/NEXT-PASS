class UserResponseDto {
    constructor(user) {
        this.id = user._id;
        this.firstName = user.firstName;
        this.lastName = user.lastName;
        this.email = user.email;
        this.userName = user.userName;
        this.phoneNumber = user.phoneNumber;
        this.isVerified = user.isVerified;
        this.dateOfBirth = user.dateOfBirth;
        this.profilePicture = user.profilePicture;
        this.role = user.role;
        this.createdAt = user.createdAt;
        this.updatedAt = user.updatedAt;
    }
}

module.exports = UserResponseDto;
