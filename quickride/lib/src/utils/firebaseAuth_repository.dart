// ignore_for_file: file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Sign in with Firebase Auth
class SignInWithFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

// Sign in with Facebook
class SignInWithFacebook {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithFacebook() async {
    try {
      final AccessToken? result = (await FacebookAuth.instance.login()) as AccessToken?;
      if (result!=null) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);
        // Once signed in, return the UserCredential
        final UserCredential authResult = await _auth.signInWithCredential(facebookAuthCredential);
        final User? user = authResult.user;
        
        return user;
      }
    } catch (error) {
      print('Error signing in with Facebook: $error');
      return null;
    }
    return null;
  }
}

// Sign in with Google
