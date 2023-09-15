import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;

  const PrimaryButton(
      {required this.label, required this.isLoading, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: shared.ColorTheme.mainTheme.colorScheme.onBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          shared.ColorTheme.mainTheme.colorScheme.surface,
                        ),
                        backgroundColor:
                            shared.ColorTheme.mainTheme.colorScheme.primary,
                      )
                    : Text(isLoading ? 'Loading' : label,
                        style: shared.TextTheme.body1(null).copyWith(
                          color:
                              shared.ColorTheme.mainTheme.colorScheme.onPrimary,
                        )))));
  }
}
