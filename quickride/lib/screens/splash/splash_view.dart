import 'package:flutter/material.dart';
import 'package:quickride/screens/splash/widgets/callToAction.dart';
import 'package:quickride/widgets/appBar.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        '/images/grid-background.png',
        fit: BoxFit.cover,
        height: 496,
        width: 428,
        alignment: Alignment.center,
      ),
      const Padding(
          padding: EdgeInsets.only(top: 52),
          child: CustomAppBar(title: 'Quickride')),
      Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Image.asset(
          '/images/car-model.png',
          fit: BoxFit.cover,
          height: 278,
          width: 459,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 548), 
        child: callToAction()),
    ]);
  }
}
