// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textStyle;
import 'package:quickride/widgets/text_field.dart' as textField;
import 'package:quickride/widgets/theme.dart' as theme;
import 'package:quickride/widgets/action_button.dart' as actionButton;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 68),
                child: Column(children: <Widget>[
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
                  const textField.TextField(
                      label: 'Email', prefixIcon: Icon(Icons.email)),
                  const SizedBox(height: 12),
                  const textField.PasswordTextField(),
                  const SizedBox(height: 28),
                  const actionButton.PrimaryButton(
                      label: 'Sign In', width: 380, onPressed: null),
                  const SizedBox(height: 16),
                  RichText(
                      text: TextSpan(
                          style: textStyle.TextTheme.body1(null).copyWith(
                              color: theme.ColorTheme.mainTheme.colorScheme
                                  .onBackground),
                          children: const <TextSpan>[
                        TextSpan(text: 'Create a new account? '),
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  const SizedBox(height: 86),
                  Text('or Sign In with',
                      style: textStyle.TextTheme.body1(null).copyWith(
                        color: Colors.black.withOpacity(0.5),
                      )),
                  const SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          '/images/google.png',
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 24),
                        Image.asset(
                          '/images/facebook.png',
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 24),
                        Image.asset(
                          '/images/apple.png',
                          height: 40,
                          width: 40,
                        )
                      ]),
                  const SizedBox(height: 84)
                ]))));
  }
}
