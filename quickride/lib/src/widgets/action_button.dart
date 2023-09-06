// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as textStyle;
import 'package:quickride/src/utils/color_theme.dart' as theme;

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;

  const PrimaryButton(
      {required this.label, required this.width, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width!, 56),
          backgroundColor: theme.ColorTheme.mainTheme.colorScheme.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
            child: Text(label,
                style: textStyle.TextTheme.body1(null).copyWith(
                  color: theme.ColorTheme.mainTheme.colorScheme.onPrimary,
                ))));
  }
}
