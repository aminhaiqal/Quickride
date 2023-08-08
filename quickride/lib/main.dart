import 'package:flutter/material.dart';
import 'package:quickride/screens/splash/splash_view.dart';
import 'package:quickride/screens/profile/profile_view.dart';
import 'package:quickride/widgets/theme.dart' as theme;

void main() {
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
        home: Scaffold(
          backgroundColor: theme.ColorTheme.mainTheme.colorScheme.background,
          body: const Splash(),
        ),
    );
  }
}
