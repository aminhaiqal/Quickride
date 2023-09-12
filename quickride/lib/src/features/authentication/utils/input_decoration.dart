import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

InputDecoration buildEmailInputDecoration({
  String label = '', helperText = '',
  IconData? prefixIcon,

}) {
  return InputDecoration(
    hintText: 'Enter your ${label.toLowerCase()}',
    labelStyle: shared.TextTheme.body1(FontWeight.w400),
    prefixIcon: Icon(prefixIcon),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: (helperText != '')
            ? shared.ColorTheme.mainTheme.colorScheme.error
            : shared.GreyShader.greyAccentLight,
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
    labelStyle: shared.TextTheme.body1(FontWeight.w400),
    prefixIcon: Icon(prefixIcon),
    suffixIcon: GestureDetector(
      onTap: onSuffixIconPressed,
      child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: (helperText != '')
            ? shared.ColorTheme.mainTheme.colorScheme.error
            : shared.GreyShader.greyAccentLight,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
  );
}
