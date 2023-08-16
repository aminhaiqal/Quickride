import 'package:shared_preferences/shared_preferences.dart';

// compare with data on the firestore
class AuthenticationRepository {
  Future<bool> login(String username, String password) async {
    // Simulate authentication logic
    if (username == 'validUsername' && password == 'validPassword') {
      // Store user information, e.g., token
      await _saveToken('userToken');
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    // Clear user information
    await _removeToken();
  }

  Future<String?> getToken() async {
    return await _loadToken();
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }

  Future<String?> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  Future<void> _removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userToken');
  }
}
