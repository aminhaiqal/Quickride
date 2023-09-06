import 'package:flutter/foundation.dart';
import '../../data/repository/authentication_repository.dart';
import 'package:quickride/src/features/authentication/data/repository/authentication_repository.dart' as auth_repo;

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

  Future<String?> firebaseLogin() async {
    try{
      String? message = await auth_repo.AuthenticationRepository.firebaseSignIn(email, password);
      return message;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<bool> facebookLogin() async {
    try{
      await AuthenticationRepository.signInWithFacebook();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> googleLogin() async {
    try{
      await AuthenticationRepository.signInWithGoogle();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
