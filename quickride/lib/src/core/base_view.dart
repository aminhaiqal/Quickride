import 'package:flutter/material.dart';
import 'package:quickride/src/utils/color_theme.dart' as theme;

// ignore: must_be_immutable
class BaseView extends StatelessWidget {
  final Widget child;
  final double marginHorizontal;
  Color? backgroundColor;

  BaseView({super.key, 
    required this.child,
    this.marginHorizontal = 24.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.ColorTheme.mainTheme.colorScheme.background,
      body: Container(
        margin: EdgeInsets.fromLTRB(marginHorizontal, 52.0, marginHorizontal, 0),
        child: child,
      ),
    );
  }
}
