import 'splash_serviceFirebase.dart' as firebase_service;

class SplashService {
  Future<String?> getImageURL(String imagePath) async {
    return await firebase_service.FirebaseStorageService().getImageURL(imagePath);
  }
}