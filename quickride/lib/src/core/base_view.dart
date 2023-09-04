import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final double marginHorizontal;
  final Color backgroundColor;

  const BaseView({super.key, 
    required this.child,
    this.marginHorizontal = 24.0,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.fromLTRB(marginHorizontal, 52.0, marginHorizontal, 0),
        child: child,
      ),
    );
  }
}
