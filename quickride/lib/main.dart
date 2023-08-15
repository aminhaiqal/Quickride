import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickride/firebase_options.dart';
import 'package:quickride/screens/splash/splash_view.dart';
import 'package:quickride/screens/login/login_view.dart';
import 'package:quickride/screens/register/register_view.dart';
import 'package:quickride/widgets/theme.dart' as theme;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quickride',
      theme: theme.ColorTheme.mainTheme,
      initialRoute: '/',
      routes: {
        '': (context) => Splash(),
        'login': (context) => const Login(),
        'register': (context) => const Register(),
      },
      home: Scaffold(
        backgroundColor: theme.ColorTheme.mainTheme.colorScheme.background,
        body: Splash(),
      ),
    );
  }
}
