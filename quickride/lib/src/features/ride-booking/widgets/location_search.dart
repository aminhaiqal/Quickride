import 'package:flutter/material.dart';

class LocationSearch extends StatelessWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: const [
          Text('Location Search')
        ],
      ),
    );
  }
}