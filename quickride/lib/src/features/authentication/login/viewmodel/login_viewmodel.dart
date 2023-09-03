// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:quickride/src/utils/firebaseAuth_repository.dart' as firebaseAuth;

class LoginViewModel with ChangeNotifier {
  String username = '';
  String password = '';

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<bool> FirebaseLogin() async {
    try{
      await firebaseAuth.SignInWithFirebase().signInWithEmailAndPassword(username, password);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
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
