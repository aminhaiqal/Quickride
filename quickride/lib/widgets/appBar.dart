// ignore_for_file: file_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/widgets/text_style.dart' as textTheme;
import 'package:quickride/widgets/theme.dart' as theme;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            style: textTheme.TextTheme.headline2.copyWith(
              color: theme.ColorTheme.mainTheme.colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
