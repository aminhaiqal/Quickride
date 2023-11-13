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
import 'package:quickride/src/widgets/custom_elevated_button.dart';

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

// Splash Screen
class Splash extends StatelessWidget {
  const Splash({super.key});

  void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final theme = shared.ColorTheme.mainTheme;
    final surfaceColor = theme.colorScheme.surface;
    const double gap = 48.0;

    return SingleChildScrollView(
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Text('Quickride',
              style: shared.TextTheme.headline2(null).copyWith(
                color: shared.ColorTheme.mainTheme.colorScheme.surface,
              )),
          const SizedBox(height: gap),
          ImageWidget(
            imageUrlFuture: firebase.AssetsFolder().getDownloadURL('tesla.png'),
            width: 380,
            aspectRatio: 1 / 1,
          ),
          const SizedBox(height: gap),
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text('Your Path for Convenient Travel',
                    textAlign: TextAlign.center,
                    style: shared.TextTheme.headline1(FontWeight.w700).copyWith(
                      color: surfaceColor,
                      letterSpacing: 0.55,
                    )),
              ),
              const SizedBox(height: 16.0),
              Text(
                  'Enjoy seamless ride experience without worrying about any obstacles.',
                  textAlign: TextAlign.center,
                  style: shared.TextTheme.headline3(FontWeight.w400).copyWith(
                    color: surfaceColor.withOpacity(0.5),
                    letterSpacing: 0.5,
                  )),
            ],
          ),
          const SizedBox(height: gap),
          GestureDetector(
              onTap: () => navigateTo(context, '/register'),
              child: CustomElevatedButton(
                onPressed: () => navigateTo(context, '/register'),
                backgroundColor: theme.colorScheme.background,
                textColor: theme.colorScheme.onBackground,
                text: 'Get Started',
              ))
        ]));
  }
}
