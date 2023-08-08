import 'package:flutter/material.dart';
import 'package:quickride/screens/splash/widgets/callToAction.dart';
import 'package:quickride/widgets/appBar.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Stack(children: [
        Container(
            width: double.infinity,
            height: 464,
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
        Positioned(
            top: 200,
            right: 0,
            child: Image.asset(
              '/images/car-model.png',
              fit: BoxFit.cover,
              height: 236,
              width: 390,
            ))
      ]),
      const SizedBox(height: 64),
      const callToAction(),
      const SizedBox(height: 40),
    ]));
  }
}
