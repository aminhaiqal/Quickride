// ignore_for_file: avoid_print

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
