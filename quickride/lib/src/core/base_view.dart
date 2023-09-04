import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final double marginHorizontal;

  const BaseView({super.key, 
    required this.child,
    this.marginHorizontal = 24.0
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(marginHorizontal, 52.0, marginHorizontal, 0)
      ),
    );
  }
}
