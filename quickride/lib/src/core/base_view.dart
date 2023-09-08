import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final double marginHorizontal, marginTop;
  final Color? backgroundGradient;
  final PreferredSizeWidget? customAppBar;

  const BaseView({super.key, 
    required this.child,
    this.marginHorizontal = 24.0,
    this.marginTop = 57.0,
    this.backgroundGradient,
    this.customAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      backgroundColor: backgroundGradient,
      body: Container(
        margin: EdgeInsets.fromLTRB(marginHorizontal, marginTop, marginHorizontal, 0.0),
        child: child)
    );
  }
}
