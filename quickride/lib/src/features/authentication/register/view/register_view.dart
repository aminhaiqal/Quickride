import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/utils/color_theme.dart' as theme;
import '../../utils/register_credential.dart';
import '../viewmodel/register_viewmodel.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
            create: (_) => RegisterViewModel(),
            child: Consumer<RegisterViewModel>(
                builder: (context, viewModel, child) {
              return SingleChildScrollView(
                  child: Center(
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 48, bottom: 64),
                      child: Column(
                        children: [
                          Text('Sign Up',
                              style: text_style.TextTheme.headline2(
                                  FontWeight.w600)),
                          Text('Create your account',
                              style: text_style.TextTheme.description(null)
                                  .copyWith(color: const Color(0xFF8C8C8C)))
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: RegisterCredential(viewModel: viewModel)),
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Already have an account? ',
                            style: text_style.TextTheme.description(
                                    FontWeight.w400)
                                .copyWith(
                                    color: theme.ColorTheme.mainTheme
                                        .colorScheme.onBackground
                                        .withOpacity(0.5))),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, '/login');
                            },
                            text: 'Sign In',
                            style: text_style.TextTheme.description(
                                    FontWeight.w500)
                                .copyWith(
                                    color: theme.ColorTheme.mainTheme
                                        .colorScheme.primary))
                      ])))
                ]),
              ));
            }));
  }
}
