// ignore_for_file: file_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as textTheme;
import 'package:quickride/src/utils/color_theme.dart' as theme;

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
    return AppBar(
      title: Text(title,
          style: textTheme.TextTheme.headline2(null).copyWith(
            color: theme.ColorTheme.mainTheme.colorScheme.surface,
          )),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
