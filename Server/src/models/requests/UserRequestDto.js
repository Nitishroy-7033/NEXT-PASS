class UserRequestDto {
    constructor({ firstName, lastName, email, userName, phoneNumber, password }) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }
}

module.exports = UserRequestDto;
