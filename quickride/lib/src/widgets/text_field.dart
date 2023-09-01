// ignore_for_file: file_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as textStyle;

class TextField extends StatelessWidget {
  final String? label;
  final Icon? prefixIcon;
  const TextField({required this.label, this.prefixIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label!,
        style: textStyle.TextTheme.description(null)
            .copyWith(color: const Color(0xFF5F5F5F)),
      ),
      const SizedBox(height: 4),
      SizedBox(
          width: MediaQuery.of(context).size.width - 24 * 2,
          height: 52,
          child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: prefixIcon,
                  labelStyle: textStyle.TextTheme.body1(FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16))))
    ]);
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Password',
        style: textStyle.TextTheme.description(null)
            .copyWith(color: const Color(0xFF5F5F5F)),
      ),
      const SizedBox(height: 4),
      SizedBox(
          width: MediaQuery.of(context).size.width - 24 * 2,
          height: 52,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your password',
                labelStyle: textStyle.TextTheme.body1(FontWeight.w400),
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
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
            obscureText: _obscureText,
          )),
      TextButton(
          onPressed: () {},
          child: Text('Forgot Password?',
              style: textStyle.TextTheme.description(null)
                  .copyWith(color: const Color(0xFFF37629))))
    ]);
  }
}
