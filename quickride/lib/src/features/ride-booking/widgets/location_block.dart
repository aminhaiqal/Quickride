import 'package:flutter/material.dart';
import 'package:quickride/src/features/ride-booking/widgets/search_bar.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

class LocationBlock extends StatelessWidget {
  const LocationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(24.0, 114.0, 24.0, 0.0),
          height: 228,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFFFFFFF),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 17,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              const SearchBar(),
              const SizedBox(height: 16),
              const InfoBlock(
                icon: Icons.home_work_rounded,
                title: 'Faculty',
                description: 'N28a, Faculty of Computing, UTM',
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                width: 348.0,
                height: 1.0,
                color: shared.GreyShader.greyAccentLight,
              ),
              const SizedBox(height: 16),
              const InfoBlock(
                icon: Icons.home_rounded,
                title: 'College',
                description: 'WA1, Kolej Datin Sri Endon, UTM',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
