import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/core/base_view.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/utils/color_theme.dart' as theme;
import '../../utils/auth_method.dart';
import '../viewmodel/login_viewmodel.dart';
import '../../utils/login_credential.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BaseView(
        backgroundGradient: theme.ColorTheme.mainTheme.colorScheme.background,
        child: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: Consumer<LoginViewModel>(builder: (context, viewModel, _) {
              return SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 48, bottom: 64),
                      child: Column(
                        children: [
                          Text('Sign In',
                              style: text_style.TextTheme.headline2(
                                  FontWeight.w600)),
                          Text('Access to your account',
                              style: text_style.TextTheme.description(null)
                                  .copyWith(color: const Color(0xFF8C8C8C)))
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: LoginCredential(viewModel: viewModel)),
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Divider(
                                color: Colors.black.withOpacity(0.5),
                                thickness: 1.0,
                                height: 0.0,
                              )),
                          const SizedBox(width: 12),
                          Flexible(
                              flex: 1,
                              child: Text('or Sign In with',
                                  style: text_style.TextTheme.description(
                                          FontWeight.w500)
                                      .copyWith(
                                          color:
                                              Colors.black.withOpacity(0.5)))),
                          const SizedBox(width: 12),
                          Flexible(
                              flex: 1,
                              child: Divider(
                                color: Colors.black.withOpacity(0.5),
                                thickness: 1.0,
                                height: 0.0,
                              ))
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: AuthMethodButton(
                              label: 'Facebook',
                              imageUrl: 'facebook.png',
                              onTap: () {
                                viewModel.facebookLogin();
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            flex: 1,
                            child: AuthMethodButton(
                              label: 'Google',
                              imageUrl: 'google.png',
                              onTap: () {
                                viewModel.googleLogin();
                              },
                            ),
                          )
                        ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Create an account? ',
                            style: text_style.TextTheme.description(
                                    FontWeight.w400)
                                .copyWith(
                                    color: theme.ColorTheme.mainTheme
                                        .colorScheme.onBackground
                                        .withOpacity(0.5))),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                            text: 'Sign Up',
                            style: text_style.TextTheme.description(
                                    FontWeight.w500)
                                .copyWith(
                                    color: theme.ColorTheme.mainTheme
                                        .colorScheme.primary))
                      ])))
                ])),
              );
            })));
  }
}
