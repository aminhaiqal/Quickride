import 'package:flutter/material.dart';
import '../utils/shared.dart' as shared;

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const CustomElevatedButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 54),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: shared.TextTheme.headline3(FontWeight.w700).copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}