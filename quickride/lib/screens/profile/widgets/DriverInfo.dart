// ignore_for_file: file_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/widgets/theme.dart' as theme;
import 'package:quickride/widgets/text_style.dart' as textTheme;
import 'package:quickride/screens/profile/widgets/DriverReview.dart' show Rating;

class DriverInfo extends StatelessWidget {
  const DriverInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ThemeData activeTheme = Theme.of(context);

        return Column(
          children: [
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('/images/persona1.png'),
            ),
            const SizedBox(height: 16.0),
            Text('Amin Haiqal', style: textTheme.TextTheme.body1.copyWith(color: activeTheme.colorScheme.onBackground)),
            const SizedBox(height: 4.0),
            Text('@aiman_aniq', style: textTheme.TextTheme.body3.copyWith(color: activeTheme.colorScheme.onBackground)),
            const SizedBox(height: 12.0),
            Text('Top Driver for Quickride. Great!!!!',
                style: textTheme.TextTheme.body2.copyWith()),
            const SizedBox(height: 4.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Rating(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
