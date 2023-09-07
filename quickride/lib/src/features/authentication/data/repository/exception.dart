
// Exceptions
class CustomValidationException implements Exception {
  final String message;

  CustomValidationException(this.message);

  @override
  String toString() => message;
}

void validateEmail(String value) {
  if (value.isEmpty) {
    throw CustomValidationException('Email is required');
  } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    throw CustomValidationException('Please enter a valid email');
  }
}

void validatePassword(String value) {
  if (value.isEmpty) {
    throw CustomValidationException('Password is required');
  } else {
    // contain at least 8 characters
    if (value.length < 8) {
      throw CustomValidationException(
          'Password must contain at least 8 characters');
    }
    // contain upper and lower case letters
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(value)) {
      throw CustomValidationException(
          'Password must contain upper and lower case letters');
    }
    // contain numbers
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      throw CustomValidationException('Password must contain numbers');
    }
    // contain special characters
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
      throw CustomValidationException(
          'Password must contain special characters');
    }
  }
}
