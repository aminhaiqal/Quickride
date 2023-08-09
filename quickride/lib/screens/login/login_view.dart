// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textStyle;
import 'package:quickride/widgets/text_field.dart' as textField;
import 'package:quickride/widgets/action_button.dart' as actionButton;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 68),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      '/images/logo.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 20),
                    Text('Sign In',
                        style: textStyle.TextTheme.headline2(FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text('Access to your account',
                        style: textStyle.TextTheme.body1(null).copyWith(
                          color: Colors.black.withOpacity(0.5),
                        )),
                    const SizedBox(height: 48),
                    const textField.TextField(label: 'Email', prefixIcon: Icon(Icons.email)),
                    const SizedBox(height: 8),
                    const textField.PasswordTextField(),
                    const SizedBox(height: 8),
                    const actionButton.PrimaryButton(label: 'Sign In', width: 380, onPressed: null),
                  ],
                ))));
  }
}
