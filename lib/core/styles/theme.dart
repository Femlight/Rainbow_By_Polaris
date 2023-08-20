import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColor.primaryColor2,
      primaryColorLight: AppColor.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          0xffEF873D, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          <int, Color>{
            50: AppColor.primaryColor2.withOpacity(.1), //10%
            100: AppColor.primaryColor2.withOpacity(.2), //20%
            200: AppColor.primaryColor2.withOpacity(.3), //30%
            300: AppColor.primaryColor2.withOpacity(.4), //40%
            400: AppColor.primaryColor2.withOpacity(.5), //50%
            500: AppColor.primaryColor2.withOpacity(.6), //60%
            600: AppColor.primaryColor2.withOpacity(.7), //70%
            700: AppColor.primaryColor2.withOpacity(.8), //80%
            800: AppColor.primaryColor2.withOpacity(.9), //90%
            900: AppColor.primaryColor2, //100%
          },
        ),
      ).copyWith(secondary: AppColor.primaryColor2),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          size: 20,
        ),
      ),
    );
  }
}
