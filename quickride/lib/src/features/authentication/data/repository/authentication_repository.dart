import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickride/src/utils/firebase_repository.dart' as firebase_repo;

class AuthenticationRepository {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<String?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      userCredential.user!.getIdToken().then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value!);
      });
      return 'Sign in successful';
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

  static Future<String?> signUp(String email, String password, String firstname,
      String lastName, int phone, String username) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      firebase_repo.UserCollection().addUser(email, '$firstname $lastName', phone, username);
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

  static Future<void> signOut() async {
    await auth.signOut();
  }

  /*static Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }*/

  static Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
