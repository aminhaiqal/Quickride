import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/widgets/image_retriever.dart';
import 'package:quickride/src/utils/color_theme.dart' as theme;
import 'package:quickride/src/utils/firebase_repository.dart' as firebase;
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
              return Center(
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
                            style:
                                text_style.TextTheme.headline2(FontWeight.w600)),
                        Text('Access to your account',
                            style: text_style.TextTheme.description(null)
                                .copyWith(color: const Color(0xFF8C8C8C))),
                        const SizedBox(height: 64),
                        UserCredential(viewModel: viewModel),
                        const SizedBox(height: 24),
                        Text('or Sign In with',
                            style:
                                text_style.TextTheme.description(FontWeight.w500)
                                    .copyWith(
                              color: Colors.black.withOpacity(0.5),
                            )),
                        const SizedBox(height: 24),
                        Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    viewModel.FacebookLogin();
                                  },
                                  child: Container(
                                      width: 182,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF5E6368),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ImageWidget(
                                              imageUrlFuture:
                                                  firebase.AssetsFolder()
                                                      .getDownloadURL(
                                                          'facebook.png'),
                                              width: 24,
                                              height: 24),
                                          const SizedBox(width: 16),
                                          Text('Facebook',
                                              style: text_style.TextTheme
                                                  .description(
                                                      FontWeight.w500)),
                                        ],
                                      )))),
                              const SizedBox(width: 16),
                              GestureDetector(
                                  onTap: () {
                                    viewModel.GoogleLogin();
                                  },
                                  child: Container(
                                      width: 182,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF5E6368),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ImageWidget(
                                              imageUrlFuture:
                                                  firebase.AssetsFolder()
                                                      .getDownloadURL(
                                                          'google.png'),
                                              width: 24,
                                              height: 24),
                                          const SizedBox(width: 16),
                                          Text('Google',
                                              style: text_style.TextTheme
                                                  .description(
                                                      FontWeight.w500)),
                                        ],
                                      ))))
                            ]),
                        const SizedBox(height: 48),
                        RichText(
                            text: TextSpan(
                                style: text_style.TextTheme.body1(null).copyWith(
                                    color: theme.ColorTheme.mainTheme
                                        .colorScheme.onBackground),
                                children: <TextSpan>[
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
                      ])));
            })));
  }
}
