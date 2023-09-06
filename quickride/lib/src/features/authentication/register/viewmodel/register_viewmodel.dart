import 'package:flutter/foundation.dart';
import 'package:quickride/src/features/authentication/data/repository/authentication_repository.dart' as auth_repo;
import 'package:quickride/src/features/authentication/data/model/user_model.dart' as user_model;

class RegisterViewModel with ChangeNotifier {
  String username = '';
  String email = '';
  String phoneNumber = '';
  String password = '';

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<String?> firebaseSignUp() async {
    user_model.User user = user_model.User(
        uid: '', username: username, email: email, phoneNumber: phoneNumber);
    String? result =
        await auth_repo.AuthenticationRepository.FirebaseSignUp(user, password);
    return result;
  }
}
