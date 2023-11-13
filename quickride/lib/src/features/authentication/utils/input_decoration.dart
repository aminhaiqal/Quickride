import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

InputDecoration buildInputDecoration({
  required String label,
  required String helperText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? onSuffixIconPressed,
}) {
  return InputDecoration(
    hintText: 'Enter your ${label.toLowerCase()}',
    labelStyle: shared.TextTheme.body1(FontWeight.w400),
    prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
    suffixIcon: suffixIcon != null
        ? GestureDetector(
            onTap: onSuffixIconPressed,
            child: Icon(suffixIcon),
          )
        : null,
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

InputDecoration buildNameInputDecoration({
  String label = '',
  String helperText = '',
}) {
  return buildInputDecoration(
    label: label,
    helperText: helperText,
  );
}

InputDecoration buildEmailInputDecoration({
  String label = '',
  String helperText = '',
  IconData? prefixIcon,
}) {
  return buildInputDecoration(
    label: label,
    helperText: helperText,
    prefixIcon: prefixIcon,
  );
}

InputDecoration buildPasswordInputDecoration({
  String label = '',
  String helperText = '',
  IconData? prefixIcon,
  IconData? suffixIcon,
  bool obscureText = true,
  VoidCallback? onSuffixIconPressed,
}) {
  return buildInputDecoration(
    label: label,
    helperText: helperText,
    prefixIcon: prefixIcon,
    suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
    onSuffixIconPressed: onSuffixIconPressed,
  );
}