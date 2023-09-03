
// validate email
String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  } else {
    // check if email is valid
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter a valid email';
    }
  }
  return null;
}

// validate password
List<String?> validatePassword(String value) {
  final List<String?> errors = [];

  if (value.isEmpty) {
    return errors..add('Password is required');
  } else {
    // contain at least 8 characters
    if (value.length < 8) {
      return errors..add('Password must contain at least 8 characters');
    }
    // contain upper and lower case letters
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(value)) {
      return errors..add('Password must contain upper and lower case letters');
    }
    // contain numbers
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      return errors..add('Password must contain numbers');
    }
    // contain special characters
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
      return errors..add('Password must contain special characters');
    }
  }
  return errors;
}
