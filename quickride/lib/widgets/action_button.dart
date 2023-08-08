import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textStyle;

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const ActionButton ({required this.label, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 52,
        width: 380,
        child: ElevatedButton(
          // ignore: sort_child_properties_last
          child: Text(label, style: textStyle.TextTheme.body1(null).copyWith(
            color: Colors.white,
          )),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ));
  }
}