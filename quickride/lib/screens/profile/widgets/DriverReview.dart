// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textTheme;

class DriverReview extends StatelessWidget {
  const DriverReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Column();
      },
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Row(
        children: [
          const Icon(Icons.star, size: 16.0),
          const SizedBox(width: 4.0),
          Text('4.5', style: textTheme.TextTheme.body2(null)),
          const SizedBox(width: 2.0),
          Text('•', style: textTheme.TextTheme.body2(null)),
          const SizedBox(width: 2.0),
          Text('16 Reviews', style: textTheme.TextTheme.body2(null)),
        ]
      );
    });
  }
}
