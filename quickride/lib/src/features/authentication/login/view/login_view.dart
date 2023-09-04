import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/widgets/image_retriever.dart';
import 'package:quickride/src/utils/color_theme.dart' as theme;
import 'package:quickride/src/utils/firebase_repository.dart' as firebase;
import '../../widgets/auth_method.dart';
import '../viewmodel/login_viewmodel.dart';
import '../../widgets/user_credential.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: Consumer<LoginViewModel>(builder: (context, viewModel, _) {
              return SingleChildScrollView(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(children: <Widget>[
                          ImageWidget(
                              imageUrlFuture: firebase.AssetsFolder()
                                  .getDownloadURL('logo.png'),
                              width: 84,
                              height: 84),
                          const SizedBox(height: 24),
                          Text('Sign In',
                              style: text_style.TextTheme.headline2(
                                  FontWeight.w600)),
                          Text('Access to your account',
                              style: text_style.TextTheme.description(null)
                                  .copyWith(color: const Color(0xFF8C8C8C))),
                          const SizedBox(height: 64),
                          UserCredential(viewModel: viewModel),
                          const SizedBox(height: 24),
                          Text('or Sign In with',
                              style: text_style.TextTheme.description(
                                      FontWeight.w500)
                                  .copyWith(
                                color: Colors.black.withOpacity(0.5),
                              )),
                          const SizedBox(height: 24),
                          Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: [
                                    AuthMethodButton(
                                      label: 'Facebook',
                                      imageUrl: 'facebook.png',
                                      onTap: () {
                                        viewModel.FacebookLogin();
                                      },
                                    ),
                                    const SizedBox(width: 16),
                                    AuthMethodButton(
                                      label: 'Google',
                                      imageUrl: 'google.png',
                                      onTap: () {
                                        viewModel.GoogleLogin();
                                      },
                                    )
                                  ],
                                )
                              ]),
                          const SizedBox(height: 48),
                          RichText(
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
                                text: 'Sign Up',
                                style: text_style.TextTheme.description(
                                        FontWeight.w500)
                                    .copyWith(
                                        color: theme.ColorTheme.mainTheme
                                            .colorScheme.primary))
                          ]))
                        ]))),
              );
            })));
  }
}
