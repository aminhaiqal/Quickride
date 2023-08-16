// ignore_for_file: file_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textStyle;

class TextField extends StatelessWidget {
  final String? label;
  final Icon? prefixIcon;
  const TextField({required this.label, this.prefixIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        child: TextFormField(
            decoration: InputDecoration(
                labelText: label,
                prefixIcon: prefixIcon,
                labelStyle: textStyle.TextTheme.body1(null),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ))));
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: textStyle.TextTheme.body1(null),
                prefixIcon: const Icon(Icons.key),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            obscureText: _obscureText,
          ),
          const SizedBox(height: 8),
          Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?',
                      style: textStyle.TextTheme.body1(null).copyWith(
                        color: Colors.black.withOpacity(0.5),
                      ))))
        ]));
  }
}
