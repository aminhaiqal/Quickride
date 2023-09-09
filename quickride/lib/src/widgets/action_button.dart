import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

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
          backgroundColor: shared.ColorTheme.mainTheme.colorScheme.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
            child: Text(label,
                style: shared.TextTheme.body1(null).copyWith(
                  color: shared.ColorTheme.mainTheme.colorScheme.onPrimary,
                ))));
  }
}
