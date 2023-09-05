import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseView extends StatelessWidget {
  final Widget child;
  final double marginHorizontal;
  final Color? backgroundGradient;

  const BaseView({super.key, 
    required this.child,
    this.marginHorizontal = 24.0,
    this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGradient,
      body: Container(
        margin: EdgeInsets.fromLTRB(marginHorizontal, 52.0, marginHorizontal, 0.0),
        child: child)
    );
  }
}
