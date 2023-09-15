import 'package:flutter/material.dart';

class TextToLoadingAnimation extends StatelessWidget {
  final bool isLoading;
  final String text;

  const TextToLoadingAnimation({Key? key, required this.isLoading, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(
              text,
              key: ValueKey(text),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}