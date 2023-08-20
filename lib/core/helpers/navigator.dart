// Flutter imports:
import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static Future<dynamic> to(BuildContext context, Widget nextScreen) {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
  }

  static void pushAndRemoveUntil(BuildContext context, Widget nextScreen) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => nextScreen),
      (Route<dynamic> route) => false,
    );
  }

  static void pushReplacement(BuildContext context, Widget nextScreen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }
}
