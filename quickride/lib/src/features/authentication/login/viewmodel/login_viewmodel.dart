import 'package:flutter/foundation.dart';
import '../../data/repository/authentication_repository.dart';
class LoginViewModel with ChangeNotifier {
  String email = '';
  String password = '';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }
}
