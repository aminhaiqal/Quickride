import 'package:flutter/material.dart';
import 'package:quickride/screens/splash/widgets/callToAction.dart';
import 'package:quickride/widgets/appBar.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(children: [
          Image.asset(
            '/images/grid-background.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
          ),
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
            ),
          ),
        ]),
        const SizedBox(height: 52),
        const callToAction(),
      ],
    ));
  }
}
