import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          Container(
            height: 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color(0xFF6B737A),
                width: 1.0,
              ),
              color: const Color(0xFFFFFFFF),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                const Icon(Icons.search, color: shared.GreyShader.greyAccentLight),
                const SizedBox(width: 8.0),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Where to?',
                      hintStyle: shared.TextTheme.body1(FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}