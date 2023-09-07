import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;

InputDecoration buildEmailInputDecoration({
  String label = '', helperText = '',
  IconData? prefixIcon,

}) {
  return InputDecoration(
    hintText: 'Enter your ${label.toLowerCase()}',
    labelStyle: text_style.TextTheme.body1(FontWeight.w400),
    prefixIcon: Icon(prefixIcon),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: (helperText != '')
            ? color_theme.ColorTheme.mainTheme.colorScheme.error
            : color_theme.GreyShader.greyAccentLight,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
  );
}

InputDecoration buildPasswordInputDecoration({
  String label = '', helperText = '',
  IconData? prefixIcon, suffixIcon,
  bool obscureText = true,
  VoidCallback? onSuffixIconPressed,

}) {
  return InputDecoration(
    hintText: 'Enter your ${label.toLowerCase()}',
    labelStyle: text_style.TextTheme.body1(FontWeight.w400),
    prefixIcon: Icon(prefixIcon),
    suffixIcon: GestureDetector(
      onTap: onSuffixIconPressed,
      child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: (helperText != '')
            ? color_theme.ColorTheme.mainTheme.colorScheme.error
            : color_theme.GreyShader.greyAccentLight,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
  );
}
