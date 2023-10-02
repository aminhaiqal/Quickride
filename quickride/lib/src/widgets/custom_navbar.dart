import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;
import 'package:bootstrap_icons/bootstrap_icons.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomNavigationBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: shared.ColorTheme.mainTheme.colorScheme.onSurface,
      ),
      
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.ticket),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.geo),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.person),
            label: 'User',
          ),
      ],
    ));
  }
}
