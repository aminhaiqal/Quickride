// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:quickride/services/splash/splash_serviceFirebase.dart';

class SplashViewModel {

  Future<String?> getImageURL(String _imagePath) {
    return FirebaseStorageService().getImageURL(_imagePath);
  }
}
