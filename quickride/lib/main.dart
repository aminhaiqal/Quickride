// ignore_for_file: library_prefixes, no_leading_underscores_for_local_identifiers, avoid_print, library_private_types_in_public_api, camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickride/src/utils/firebase_options.dart';
import 'package:quickride/src/features/authentication/login/view/login_view.dart';
import 'package:quickride/src/utils/text_style.dart' as textTheme;
import 'package:quickride/src/utils/color_theme.dart' as theme;
import 'package:quickride/src/widgets/appBar.dart';
import 'package:quickride/src/utils/firebase_repository.dart' as firebase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: Scaffold(
        backgroundColor: theme.ColorTheme.mainTheme.colorScheme.background,
        body: const Splash(),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.026, 1], colors: [Color(0xFF222222), Color(0xFF121212)]).colors[0],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 24 * 2,
                  height: (MediaQuery.of(context).size.height - 24 * 2)*2.026,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 52),
                    child: CustomAppBar(title: 'Quickride'))),
              ),
              const SizedBox(height: 123),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 24 * 2,
                  height: (MediaQuery.of(context).size.height - 24 * 2)*1.623,
                  child: ImageWidget(
                    imageUrlFuture: firebase.AssetsFolder().getDownloadURL('tesla.png'),
                  )
                ))
            ],
          ),
        )
        /*child: Column(children: [
      Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.026,
                  1
                ],
                    colors: [
                  Color(0xFF222222),
                  Color(0xFF121212),
                ]))),
        const Padding(
            padding: EdgeInsets.only(top: 52),
            child: CustomAppBar(title: 'Quickride')),
        ImageWidget(
            imageUrlFuture:
                firebase.AssetsFolder().getDownloadURL('tesla.png')),
      ]),
      const SizedBox(height: 64),
      const callToAction(),
      const SizedBox(height: 40),
    ])*/
    );
  }
}

class ImageWidget extends StatefulWidget {
  final Future<String?> imageUrlFuture;

  const ImageWidget({super.key, required this.imageUrlFuture});

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    loadImageUrl();
  }

  void loadImageUrl() async {
    String? imageUrl = await widget.imageUrlFuture;
    setState(() {
      _imageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _imageUrl != null
          ? Image.network(
              _imageUrl as String,
              fit: BoxFit.cover,
              cacheHeight: (284 * 0.85).toInt(),
              cacheWidth: (399 * 0.85).toInt(),
              scale: 1.0,
            )
          : const CircularProgressIndicator(),
    );
  }
}

class callToAction extends StatelessWidget {
  const callToAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
            child: Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width - 24 * 2,
              child: Align(
                  alignment: Alignment.center,
                  child: Text('Make travelling by car most comfortable',
                      textAlign: TextAlign.center,
                      style: textTheme.TextTheme.headline1(null).copyWith(
                        color:
                            theme.ColorTheme.mainTheme.colorScheme.onBackground,
                      )))),
          const SizedBox(height: 24),
          SizedBox(
              width: MediaQuery.of(context).size.width - 24 * 2,
              child: Text(
                  'Enjoy seamless ride experience without worrying about any obstacles.',
                  textAlign: TextAlign.center,
                  style: textTheme.TextTheme.headline3(null).copyWith(
                    color: theme.ColorTheme.mainTheme.colorScheme.onBackground
                        .withOpacity(0.5),
                  ))),
          const SizedBox(height: 80),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Container(
                height: 54,
                width: MediaQuery.of(context).size.width - 24 * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.ColorTheme.mainTheme.colorScheme.primary,
                ),
                child: Center(
                    child: Text('Get Started',
                        style: textTheme.TextTheme.headline3(null).copyWith(
                          color:
                              theme.ColorTheme.mainTheme.colorScheme.onPrimary,
                        )))),
          ),
          const SizedBox(height: 16),
          RichText(
              text: TextSpan(
                  style: textTheme.TextTheme.body1(null).copyWith(
                      color:
                          theme.ColorTheme.mainTheme.colorScheme.onBackground),
                  children: <TextSpan>[
                TextSpan(
                    text: 'Already have an account? ',
                    style: textTheme.TextTheme.description(null).copyWith(
                        color: theme
                            .ColorTheme.mainTheme.colorScheme.onBackground)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/login');
                      },
                    text: 'Sign In',
                    style: textTheme.TextTheme.description(null).copyWith(
                        color: theme.ColorTheme.mainTheme.colorScheme.primary))
              ]))
        ])));
  }
}
