// ignore_for_file: file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Sign in with Firebase Auth
class SignInWithFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
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
}

// Sign in with Facebook
class SignInWithFacebook {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithFacebook() async {
    try {
      final AccessToken? result =
          (await FacebookAuth.instance.login()) as AccessToken?;
      if (result != null) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.token);
        // Once signed in, return the UserCredential
        final UserCredential authResult =
            await _auth.signInWithCredential(facebookAuthCredential);
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
class SignInWithGoogle {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        return user;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

// Sign out
class SignOutHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print("Sign out error: $error");
    }
  }
}
