class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);

  @override
  String toString() => message;

  static void validateUsername(String value) {
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      throw ValidationException(
          'Username must contain only letters and numbers');
    }
  }

  static void validateEmail(String value) {
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      throw ValidationException('Please enter a valid email');
    }
  }

  static void validatePassword(String value) {
    // contain at least 8 characters
    if (value.length < 8) {
      throw ValidationException('Password must contain at least 8 characters');
    }
    // contain upper and lower case letters
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(value)) {
      throw ValidationException(
          'Password must contain upper and lower case letters');
    }
    // contain numbers
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      throw ValidationException('Password must contain numbers');
    }
  }
}
