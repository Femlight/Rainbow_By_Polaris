// Flutter imports:
import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class AppPadding {
  AppPadding._();

  static double horizontal = 20;
  static double vertical = 15;

  static EdgeInsetsGeometry get defaultPadding {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  static EdgeInsetsGeometry get symetricHorizontalOnly {
    return EdgeInsets.symmetric(horizontal: horizontal);
  }

  static EdgeInsetsGeometry get symetricVerticalOnly {
    return EdgeInsets.symmetric(vertical: vertical);
  }
}
