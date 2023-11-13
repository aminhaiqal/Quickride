import 'package:flutter/material.dart';

class TextTheme {
  static TextStyle headline1(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;
    
    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 34,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headline2(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 20,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headline3(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 17,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body1(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w500;

    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 16,
      fontWeight: fontWeight,
    );
  }

  static TextStyle description(FontWeight? fontWeight) {
    fontWeight ??= FontWeight.w400;

    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 17,
      fontWeight: fontWeight,
    );
  }
}