class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty.";
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return "Enter a valid email.";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.length < 6) {
      return "Password must be at least 6 characters long.";
    }
    return null;
  }
}
