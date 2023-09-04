import 'package:flutter/material.dart';

class MarginContainer extends StatelessWidget {
  final Widget child;
  final double marginBottom;

  const MarginContainer({
    super.key,
    required this.child,
    this.marginBottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      child: child,
    );
  }
}
