import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseView extends StatelessWidget {
  final Widget child;
  final double marginHorizontal;
  final Color? backgroundGradient;
  final PreferredSizeWidget? customAppBar;

  const BaseView({super.key, 
    required this.child,
    this.marginHorizontal = 24.0,
    this.backgroundGradient,
    this.customAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      backgroundColor: backgroundGradient,
      body: Container(
        margin: EdgeInsets.fromLTRB(marginHorizontal, 57, marginHorizontal, 0.0),
        child: child)
    );
  }
}
