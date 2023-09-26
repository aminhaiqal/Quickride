import 'package:flutter/material.dart';

class ServiceType extends StatelessWidget {
  const ServiceType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            ServiceTypeItem(
              title: 'Carpooling',
              icon: Icons.directions_car,
              onTap: () {},
            ),
            ServiceTypeItem(
              title: 'Local Events',
              icon: Icons.directions_bus,
              onTap: () {},
            ),
            ServiceTypeItem(
              title: 'Schedule',
              icon: Icons.schedule,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class ServiceTypeItem extends StatelessWidget {
  const ServiceTypeItem({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final Null Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 116,
      height: 79,
    );
  }
}
