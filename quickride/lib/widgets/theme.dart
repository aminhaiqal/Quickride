// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTheme {
  static ThemeData get lightTheme {

    final ColorScheme customColorScheme = ColorScheme(
    primary: Color(0xFFEA600B),
    secondary: Color(0xFF2978A0),
    surface: Colors.white,
    background: Colors.white,
    error: Color(0xFFE12C2C),
    onPrimary: Colors.white,
    onSecondary: Color(0xFF121212),
    onSurface: Color(0xFF121212),
    onBackground: Color(0xFF121212),
    onError: Colors.white,
    brightness: Brightness.light,
  );
    return ThemeData(
      colorScheme: customColorScheme,
    );
  }

  static ThemeData get darkTheme {

    final ColorScheme customColorScheme = ColorScheme(
    primary: Color(0xFFF37629),
    secondary: Color(0xFF3980A4),
    surface: Color(0xFF121212),
    background: Color(0xFF121212),
    error: Color(0xFFE64E4D),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  );
    return ThemeData(
      colorScheme: customColorScheme,
    );
  }
}

class TextTheme {
  static TextStyle get headline1 {
    return GoogleFonts.montserrat(
      fontSize: 56,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline2 {
    return GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get headline3 {
    return GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get body1 {
    return GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get body2 {
    return GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

    static TextStyle get body3 {
    return GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: FontWeight.w500,
    );
  }
}