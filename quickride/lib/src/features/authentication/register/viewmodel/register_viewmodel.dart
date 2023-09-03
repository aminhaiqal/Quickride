import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:quickride/src/features/authentication/data/model/user_model.dart' as user_model;
import 'package:quickride/src/features/authentication/data/repository/authentication_repository.dart' as auth_repo;


class RegisterViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String username = '';
  String email = '';
  String password = '';
  String phoneNumber = '';

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  Future<bool> registerWithEmailAndPassword() async {
    try {
      final user_model.User user = user_model.User(
        uid: _auth.currentUser!.uid,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
      );
      await auth_repo.AuthenticationRepository.FirebaseSignUp(user, password);
      return true; // Registration successful
    } catch (e) {
      return false; // Registration failed
    }
  }
}