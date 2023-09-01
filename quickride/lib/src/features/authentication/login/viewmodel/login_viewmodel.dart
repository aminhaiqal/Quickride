import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void loadSavedLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe = prefs.getBool('rememberMe') ?? false;
    if (rememberMe) {
      usernameController.text = prefs.getString('username') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    }
    notifyListeners();
  }

  void saveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      prefs.setString('username', usernameController.text);
      prefs.setString('password', passwordController.text);
    } else {
      prefs.remove('username');
      prefs.remove('password');
    }
    prefs.setBool('rememberMe', rememberMe);
  }

  // Implement your login logic here
}

class ImageWidget extends StatefulWidget {
  final Future<String?> imageUrlFuture;

  const ImageWidget({super.key, required this.imageUrlFuture});

  @override
  // ignore: library_private_types_in_public_api
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    loadImageUrl();
  }

  void loadImageUrl() async {
    String? imageUrl = await widget.imageUrlFuture;
    setState(() {
      _imageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _imageUrl != null
          ? Image.network(
              _imageUrl as String,
              fit: BoxFit.cover,
              cacheHeight: 100,
              cacheWidth: 100,
            )
          : const CircularProgressIndicator(),
    );
  }
}