import 'package:flutter/material.dart';
import 'package:quickride/screens/splash/splash_viewmodel.dart';
import 'package:quickride/screens/splash/widgets/callToAction.dart';
import 'package:quickride/screens/splash/widgets/imageWidget.dart';
import 'package:quickride/widgets/appBar.dart';

class Splash extends StatelessWidget {
  final SplashViewModel _viewModel = SplashViewModel();
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Stack(children: [
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.026,1],
                    colors: [Color(0xFF222222),Color(0xFF121212),]))),
        const Padding(
            padding: EdgeInsets.only(top: 52),
            child: CustomAppBar(title: 'Quickride')),
        ImageWidget(imageUrlFuture: _viewModel.getImageURL('car-model.png')),
      ]),
      const SizedBox(height: 64),
      const callToAction(),
      const SizedBox(height: 40),
    ]));
  }
}
