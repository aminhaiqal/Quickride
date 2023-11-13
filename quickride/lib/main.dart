import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickride/src/core/base_view.dart';
import 'package:quickride/src/features/authentication/view/register_view.dart';
import 'package:quickride/src/utils/firebase_options.dart';
import 'package:quickride/src/features/authentication/view/login_view.dart';
import 'package:quickride/src/utils/shared.dart' as shared;
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
    final theme = shared.ColorTheme.mainTheme;
    final backgroundGradient = theme.colorScheme.background;

    return MaterialApp(
      title: 'Quickride',
      theme: theme,
      home: BaseView(
          backgroundGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.026, 1],
            colors: [Color(0xFF222222), Color(0xFF121212)],
          ).colors[0],
          child: const Splash()),
      initialRoute: '/',
      routes: {
        '/login': (context) => BaseView(
            backgroundGradient: backgroundGradient, child: const Login()),
        '/register': (context) => BaseView(
            backgroundGradient: backgroundGradient, child: const Register()),
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: Center(
                child: Text('Quickride',
                    style: shared.TextTheme.headline2(null).copyWith(
                      color: shared.ColorTheme.mainTheme.colorScheme.surface,
                    )))),
        ImageWidget(
          imageUrlFuture: firebase.AssetsFolder().getDownloadURL('tesla.png'),
          width: 380,
          aspectRatio: 1 / 1,
        ),
        const CallToAction()
      ],
    ));
  }
}

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final theme = shared.ColorTheme.mainTheme;
    final surfaceColor = theme.colorScheme.surface;
    final primaryColor = theme.colorScheme.primary;
    final onPrimaryColor = theme.colorScheme.onPrimary;

    return Center(
        child: Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Align(
            alignment: Alignment.center,
            child: Text('Make travelling by car most comfortable',
                textAlign: TextAlign.center,
                style: shared.TextTheme.headline1(null).copyWith(
                  color: surfaceColor,
                ))),
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 72.0),
          child: Text(
              'Enjoy seamless ride experience without worrying about any obstacles.',
              textAlign: TextAlign.center,
              style: shared.TextTheme.headline3(FontWeight.w400).copyWith(
                color: surfaceColor.withOpacity(0.5),
              ))),
      GestureDetector(
        onTap: () => navigateTo(context, '/register'),
        child: CustomElevatedButton(
          onPressed: () => navigateTo(context, '/register'),
          backgroundColor: primaryColor,
          textColor: onPrimaryColor,
          text: 'Get Started',
        ),
      ),
      RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Already have an account? ',
            style: shared.TextTheme.description(FontWeight.w400)
                .copyWith(color: surfaceColor.withOpacity(0.5))),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => navigateTo(context, '/login'),
            text: 'Sign In',
            style: shared.TextTheme.description(FontWeight.w500)
                .copyWith(color: primaryColor))
      ]))
    ]));
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const CustomElevatedButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 56),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: shared.TextTheme.headline3(null).copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
