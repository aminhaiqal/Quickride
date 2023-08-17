// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AssetsFolder {
  final String bucketURL = 'quickride-qr0103.appspot.com';

  Future<String?> getDownloadURL(String imagePath) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('assets/$imagePath');
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error retrieving image URL: $e');
      return null;
    }
  }
}

class UserCollection {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //add new document id
  Future<void> addUser(String email, String name, int phone, String username) {
    DocumentReference newDocRef = users.doc();
    return users
        .doc(newDocRef.id)
        .set({
          'email': email,
          'name': name,
          'phone': phone,
          'username': username,
        })
        .then((value) => print('User added'))
        .catchError((error) => print('Failed to add user: $error'));
  }
}
