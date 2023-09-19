import 'package:flutter/material.dart';

class LocationSearch extends StatelessWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
              height: 157,
              width: 370,
              color: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.026, 1],
                colors: [Color(0xFF222222), Color(0xFF121212)],
              ).colors[0])
        ])
      ],
    );
  }
}
