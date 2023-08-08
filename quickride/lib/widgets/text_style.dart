import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTheme {
  static TextStyle headline1(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;
    
    return GoogleFonts.montserrat(
      fontSize: 32,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headline2(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headline3(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body1(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body2(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body3(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 10,
      fontWeight: fontWeight,
    );
  }
}