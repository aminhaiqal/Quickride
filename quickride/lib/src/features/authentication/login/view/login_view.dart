import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/shared.dart' as shared;
import '../../utils/auth_method.dart';
import '../viewmodel/login_viewmodel.dart';
import '../../utils/login_credential.dart';
import 'package:quickride/src/features/authentication/data/repository/authentication_repository.dart' as auth_repo;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
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
                              style: shared.TextTheme.headline2(
                                  FontWeight.w600)),
                          Text('Access to your account',
                              style: shared.TextTheme.description(null)
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
                                  style: shared.TextTheme.description(
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
                                auth_repo.AuthenticationRepository.signInWithFacebook();
                              },
                            )),
                          const SizedBox(width: 16),
                          Flexible(
                            flex: 1,
                            child: AuthMethodButton(
                              label: 'Google',
                              imageUrl: 'google.png',
                              onTap: () {
                                auth_repo.AuthenticationRepository.signInWithGoogle();
                              },
                            ))
                        ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Create an account? ',
                            style: shared.TextTheme.description(
                                    FontWeight.w400)
                                .copyWith(
                                    color: shared.ColorTheme.mainTheme
                                        .colorScheme.onBackground
                                        .withOpacity(0.5))),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                            text: 'Sign Up',
                            style: shared.TextTheme.description(
                                    FontWeight.w500)
                                .copyWith(
                                    color: shared.ColorTheme.mainTheme
                                        .colorScheme.primary))
                      ])))
                ])),
              );
            }));
  }
}
