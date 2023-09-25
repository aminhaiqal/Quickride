import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

class InfoBlock extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoBlock({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 28),
        Icon(icon),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: shared.TextTheme.body1(null),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: shared.TextTheme.description(null),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
