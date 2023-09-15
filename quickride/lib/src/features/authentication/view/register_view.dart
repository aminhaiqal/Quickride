import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/shared.dart' as shared;
import '../utils/register_credential.dart';
import '../viewmodel/auth_viewmodel.dart' show AuthViewModel;

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
            create: (_) => AuthViewModel(),
            child: Consumer<AuthViewModel>(
                builder: (context, viewModel, child) {
              return SingleChildScrollView(
                  child: Center(
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 48, bottom: 64),
                      child: Column(
                        children: [
                          Text('Sign Up',
                              style: shared.TextTheme.headline2(
                                  FontWeight.w600)),
                          Text('Create your account',
                              style: shared.TextTheme.description(null)
                                  .copyWith(color: const Color(0xFF8C8C8C)))
                        ],
                      )),
                  RegisterCredential(viewModel: viewModel),
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Already have an account? ',
                            style: shared.TextTheme.description(
                                    FontWeight.w400)
                                .copyWith(
                                    color: shared.ColorTheme.mainTheme
                                        .colorScheme.onBackground
                                        .withOpacity(0.5))),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, '/login');
                            },
                            text: 'Sign In',
                            style: shared.TextTheme.description(
                                    FontWeight.w500)
                                .copyWith(
                                    color: shared.ColorTheme.mainTheme
                                        .colorScheme.primary))
                      ])))
                ]),
              ));
            }));
  }
}
