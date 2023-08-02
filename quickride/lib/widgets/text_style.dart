import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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