export '../features/authentication/data/repository/exception.dart'
    show ValidationException;

void validateAndSetField(String text, Function() validator,
    Function(String) fieldSetter, Function(String) errorMessageSetter) {
  try {
    String error = validator().toString();
    // error
    if (error != '') {
      fieldSetter(text);
    } else {
      errorMessageSetter(error);
    }
  } catch (e) {
    errorMessageSetter(e.toString());
  }
}
