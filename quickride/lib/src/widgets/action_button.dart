// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as textStyle;
import 'package:quickride/src/utils/color_theme.dart' as theme;

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;

  const PrimaryButton({required this.label, required this.width, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFF212121),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text(
            label,
            style: textStyle.TextTheme.body1(null).copyWith(
              color: theme.ColorTheme.mainTheme.colorScheme.onPrimary,
            )
          )
        )
        )
    );
  }
}