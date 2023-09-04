import 'package:flutter/widgets.dart';

class Spacing {
  static double small = 8.0;
  static double medium = 16.0;
  static double large = 24.0;

  // Define methods to calculate spacing based on screen width or height
  static double getHorizontalSpacing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 600) {
      return large;
    } else if (screenWidth >= 400) {
      return medium;
    } else {
      return small;
    }
  }

  static double getVerticalSpacing(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight >= 600) {
      return large;
    } else if (screenHeight >= 400) {
      return medium;
    } else {
      return small;
    }
  }
}
