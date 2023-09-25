import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

class ClosestDriver extends StatelessWidget {
  const ClosestDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.026, 1],
        colors: [Color(0xFF222222), Color(0xFF121212)],
      ).colors[0] 
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      height: 104,
      child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Flexible(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFFFFFFFF),
        ),
      ),
    ),
    const SizedBox(width: 16),
    Flexible(
      flex: 5,
      child: Text(
        'Find the closest driver from your location',
        style: shared.TextTheme.body1(FontWeight.w400).copyWith(
          color: shared.ColorTheme.mainTheme.colorScheme.surface,
        ),
      ),
    ),
  ],
)

    );
  }
}
