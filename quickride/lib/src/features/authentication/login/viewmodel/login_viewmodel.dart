// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:quickride/src/utils/firebaseAuth_repository.dart' as firebaseAuth;
import 'package:quickride/src/features/authentication/data/repository/authentication_repository.dart' as auth_repo;

class LoginViewModel with ChangeNotifier {
  String email = '';
  String password = '';

  void setUsername(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<String?> FirebaseLogin() async {
    try{
      String? message = await auth_repo.AuthenticationRepository.FirebaseSignIn(email, password);
      return message;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<bool> FacebookLogin() async {
    try{
      await firebaseAuth.SignInWithFacebook().signInWithFacebook();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> GoogleLogin() async {
    try{
      await firebaseAuth.SignInWithGoogle().signInWithGoogle();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
