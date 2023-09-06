import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickride/src/core/base_view.dart';
import 'package:quickride/src/utils/firebase_options.dart';
import 'package:quickride/src/features/authentication/login/view/login_view.dart';
import 'package:quickride/src/utils/text_style.dart' as text_theme;
import 'package:quickride/src/utils/color_theme.dart' as theme;
import 'package:quickride/src/utils/firebase_repository.dart' as firebase;
import 'package:quickride/src/widgets/image_retriever.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quickride',
        theme: theme.ColorTheme.mainTheme,
        initialRoute: '/',
        routes: {
          '': (context) => const Splash(),
          '/login': (context) => const Login(),
          '/register': (context) => const Login(),
        },
        home: const Splash());
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        backgroundGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.026, 1],
          colors: [Color(0xFF222222), Color(0xFF121212)],
        ).colors[0],
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Center(
                    child: Text('Quickride',
                        style: text_theme.TextTheme.headline2(null).copyWith(
                          color: theme.ColorTheme.mainTheme.colorScheme.surface,
                        )))),
            ImageWidget(
              imageUrlFuture:
                  firebase.AssetsFolder().getDownloadURL('tesla.png'),
              width: 380,
              aspectRatio: 1 / 1,
            ),
            const callToAction()
          ],
        )));
  }
}

class callToAction extends StatelessWidget {
  const callToAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Align(
            alignment: Alignment.center,
            child: Text('Make travelling by car most comfortable',
                textAlign: TextAlign.center,
                style: text_theme.TextTheme.headline1(null).copyWith(
                  color: theme.ColorTheme.mainTheme.colorScheme.surface,
                ))),
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 72.0),
          child: Text(
              'Enjoy seamless ride experience without worrying about any obstacles.',
              textAlign: TextAlign.center,
              style: text_theme.TextTheme.headline3(FontWeight.w400).copyWith(
                color: theme.ColorTheme.mainTheme.colorScheme.surface
                    .withOpacity(0.5),
              ))),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: theme.ColorTheme.mainTheme.colorScheme.primary,
            ),
            child: Center(
                child: Text('Get Started',
                    style: text_theme.TextTheme.headline3(null).copyWith(
                      color: theme.ColorTheme.mainTheme.colorScheme.onPrimary,
                    )))),
      ),
      RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Already have an account? ',
            style: text_theme.TextTheme.description(FontWeight.w400).copyWith(
                color: theme.ColorTheme.mainTheme.colorScheme.surface
                    .withOpacity(0.5))),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/login');
              },
            text: 'Sign In',
            style: text_theme.TextTheme.description(FontWeight.w500).copyWith(
                color: theme.ColorTheme.mainTheme.colorScheme.primary))
      ]))
    ]));
  }
}
