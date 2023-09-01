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

    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headline3(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body1(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: fontWeight,
    );
  }

  static TextStyle description(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: fontWeight,
    );
  }
}