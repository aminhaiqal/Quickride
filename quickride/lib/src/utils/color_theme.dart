// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';

class ColorTheme {
  static ThemeData get mainTheme {
    final ColorScheme customColorScheme = ColorScheme(
      primary: Color(0xFFF37629),
      secondary: Color(0xFF3980A4),
      surface: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      error: Color(0xFFE12C2C),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFF121212),
      onSurface: Color(0xFF121212),
      onBackground: Color(0xFF121212),
      onError: Color(0xFFFFFFFF),
      brightness: Brightness.light,
    );
    return ThemeData(
      colorScheme: customColorScheme,
    );
  }
}

class GreyShader {
  static const Color grey = Color(0xFF5F5F5F);
  static const Color greyLight = Color(0xFFAFAFAF);
  static const Color greyLighter = Color(0xFFE0E0E0);
  static const Color greyLightest = Color(0xFFF2F2F2);

  static const Color greyDark = Color(0xFF3C3C3C);
  static const Color greyDarker = Color(0xFF1A1A1A);
  static const Color greyDarkest = Color(0xFF121212);

  static const Color greyTransparent = Color(0x5F5F5F5F);
  static const Color greyLightTransparent = Color(0x5FAFAFAF);
  static const Color greyLighterTransparent = Color(0x5FE0E0E0);
  static const Color greyLightestTransparent = Color(0x5FF2F2F2);

  static const Color greyDarkTransparent = Color(0x5F3C3C3C);
  static const Color greyDarkerTransparent = Color(0x5F1A1A1A);
  static const Color greyDarkestTransparent = Color(0x5F121212);

  static const Color greyAccent = Color(0xFF5F5F5F);
  static const Color greyAccentLight = Color(0xFFAFAFAF);
  static const Color greyAccentLighter = Color(0xFFE0E0E0);
  static const Color greyAccentLightest = Color(0xFFF2F2F2);

  static const Color greyAccentDark = Color(0xFF3C3C3C);
  static const Color greyAccentDarker = Color(0xFF1A1A1A);
  static const Color greyAccentDarkest = Color(0xFF121212);

  static const Color greyAccentTransparent = Color(0x5F5F5F5F);
  static const Color greyAccentLightTransparent = Color(0x5FAFAFAF);
  static const Color greyAccentLighterTransparent = Color(0x5FE0E0E0);
  static const Color greyAccentLightestTransparent = Color(0x5FF2F2F2);
}
