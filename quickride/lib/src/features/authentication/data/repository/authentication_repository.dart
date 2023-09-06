import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickride/src/utils/firebase_repository.dart' as firebase_repo;
import 'package:quickride/src/features/authentication/data/model/user_model.dart' as user_model;

class AuthenticationRepository {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Firebase Authentication Sign Up 
  static Future<String?> firebaseSignUp(user_model.User user, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: user.email, password: password);
      user.uid = userCredential.user!.uid;
      firebase_repo.UserCollection().addUser(user);
      return 'Sign up successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email provided';
      }
      rethrow;
    } catch (e) {
      return e.toString();
    }
  }

  // Firebase Authentication Sign In
  static Future<String?> firebaseSignIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      userCredential.user!.getIdToken().then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value!);
      });
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email provided';
      }
      rethrow;
    } catch (e) {
      return e.toString();
    }
  }

  // Firebase Reset Password Email
  static Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Sign in with Facebook
  static Future<User?> signInWithFacebook() async {
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

  // Sign in with Google
  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        // Create a new credential
        final OAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // Once signed in, return the UserCredential
        final UserCredential authResult =
            await _auth.signInWithCredential(googleAuthCredential);
        final User? user = authResult.user;

        return user;
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
    return null;
  }
}
