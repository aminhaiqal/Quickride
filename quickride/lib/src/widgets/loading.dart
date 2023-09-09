import 'package:flutter/material.dart';

class TextToLoadingAnimation extends StatelessWidget {
  final bool isLoading;
  final VoidCallback startLoading;

  const TextToLoadingAnimation({Key? key, required this.isLoading, required this.startLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : TextButton(
              onPressed: startLoading,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}