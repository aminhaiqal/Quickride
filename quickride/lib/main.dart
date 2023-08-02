import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/widgets/theme_provider.dart';
import 'package:quickride/screens/profile/profile_view.dart';
import 'package:quickride/widgets/theme.dart' as theme;

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
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
    bool _isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    // condition ? expIfTrue : expIfFalse
    ThemeData activeTheme = _isDarkMode ? theme.ColorTheme.darkTheme : theme.ColorTheme.lightTheme;
    Color backgroundColor = activeTheme.colorScheme.background;

    //Color textColor = backgroundColor.computeLuminance() < 0.5 ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

    return MaterialApp(
        title: 'My App',
        theme: activeTheme,
        home: Scaffold(
          backgroundColor: backgroundColor,
          body: const DriverProfile(),
        ),
    );
  }
}
