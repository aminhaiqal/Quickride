import 'package:flutter/foundation.dart';
export '../data/repository/exception.dart' show ValidationException;
import '../data/repository/authentication_repository.dart' as auth_repo;
import 'package:quickride/src/features/authentication/data/model/user_model.dart'
    as user_model;

class AuthViewModel with ChangeNotifier {
  String username = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

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

  bool get isSignInFormValid => email.isNotEmpty && password.isNotEmpty;

  bool get isSignUpFormValid =>
      username.isNotEmpty &&
      email.isNotEmpty &&
      phoneNumber.isNotEmpty &&
      password.isNotEmpty;

  Future<bool> signUp() async {
    isLoading = true;
    notifyListeners();
    try {
      await auth_repo.AuthenticationRepository.firebaseSignUp(
          user_model.User(
              username: username, email: email, phoneNumber: phoneNumber),
          password);
      return true;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();
    try {
      await auth_repo.AuthenticationRepository.firebaseSignIn(email, password);

    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword() async {
    isLoading = true;
    notifyListeners();
    try {
      await auth_repo.AuthenticationRepository.sendPasswordResetEmail(email);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithFacebook() async {
    isLoading = true;
    notifyListeners();
    try {
      await auth_repo.AuthenticationRepository.signInWithFacebook();
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading = true;
    notifyListeners();
    try {
      await auth_repo.AuthenticationRepository.signInWithGoogle();
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
