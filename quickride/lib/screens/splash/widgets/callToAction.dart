// ignore_for_file: camel_case_types, library_prefixes, file_names

import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textTheme;
import 'package:quickride/widgets/theme.dart' as theme;

class callToAction extends StatelessWidget {
  const callToAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 380,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Make travelling by car most comfortable',
                    textAlign: TextAlign.center,
                    style: textTheme.TextTheme.headline1.copyWith(
                      color:
                          theme.ColorTheme.mainTheme.colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 380,
                child: Text(
                  'Enjoy seamless ride experience without worrying about any obstacles.',
                  textAlign: TextAlign.center,
                  style: textTheme.TextTheme.headline3.copyWith(
                    color: theme.ColorTheme.mainTheme.colorScheme.onBackground
                        .withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Container(
                height: 54,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.ColorTheme.mainTheme.colorScheme.primary,
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: textTheme.TextTheme.body1.copyWith(
                      color: theme.ColorTheme.mainTheme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: textTheme.TextTheme.body1,
                  children: const <TextSpan>[
                    TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
