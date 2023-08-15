// ignore_for_file: file_names, avoid_print

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageService {
  final String bucketURL = 'quickride-qr0103.appspot.com';

  Future<String?> getImageURL(String imagePath) async {
    try {
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child('assets/$imagePath');
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error retrieving image URL: $e');
      return null;
    }
  }
}
