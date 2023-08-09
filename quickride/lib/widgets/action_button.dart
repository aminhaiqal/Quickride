import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textStyle;
import 'package:quickride/widgets/theme.dart' as theme;

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
        height: 52,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
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