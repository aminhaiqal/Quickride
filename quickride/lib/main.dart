import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:quickride/src/core/base_view.dart';
import 'package:quickride/src/features/authentication/view/register_view.dart';
import 'package:quickride/src/utils/firebase_options.dart';
import 'package:quickride/src/features/authentication/view/login_view.dart';
import 'package:quickride/src/features/ride-booking/view/homepage_view.dart';
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
  final Location location = Location();
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quickride',
      theme: shared.ColorTheme.mainTheme,
      /*home: BaseView(
          backgroundGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.026, 1],
            colors: [Color(0xFF222222), Color(0xFF121212)],
          ).colors[0],
          child: const Splash()),*/
      initialRoute: '/homepage',
      routes: {
        '/login': (context) => BaseView(
            backgroundGradient:
                shared.ColorTheme.mainTheme.colorScheme.background,
            child: const Login()),
        '/register': (context) => BaseView(
            backgroundGradient:
                shared.ColorTheme.mainTheme.colorScheme.background,
            child: const Register()),
        '/homepage': (context) => BaseView(
            backgroundGradient:
                shared.ColorTheme.mainTheme.colorScheme.background,
            child: const Homepage()),
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

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
  const CallToAction({Key? key}) : super(key: key);

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
                style: shared.TextTheme.headline1(null).copyWith(
                  color: shared.ColorTheme.mainTheme.colorScheme.surface,
                ))),
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 72.0),
          child: Text(
              'Enjoy seamless ride experience without worrying about any obstacles.',
              textAlign: TextAlign.center,
              style: shared.TextTheme.headline3(FontWeight.w400).copyWith(
                color: shared.ColorTheme.mainTheme.colorScheme.surface
                    .withOpacity(0.5),
              ))),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/register');
        },
        // change to Elevated Button
        child: Container(
          margin: const EdgeInsets.only(bottom: 24.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 56),
                backgroundColor:
                    shared.ColorTheme.mainTheme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Center(
                  child: Text('Get Started',
                      style: shared.TextTheme.headline3(null).copyWith(
                        color:
                            shared.ColorTheme.mainTheme.colorScheme.onPrimary,
                      )))),
        ),
      ),
      RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Already have an account? ',
            style: shared.TextTheme.description(FontWeight.w400).copyWith(
                color: shared.ColorTheme.mainTheme.colorScheme.surface
                    .withOpacity(0.5))),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/login');
              },
            text: 'Sign In',
            style: shared.TextTheme.description(FontWeight.w500).copyWith(
                color: shared.ColorTheme.mainTheme.colorScheme.primary))
      ]))
    ]));
  }
}
