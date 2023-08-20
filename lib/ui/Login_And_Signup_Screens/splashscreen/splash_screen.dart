// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_by_polaris/ui/Login_And_Signup_Screens/onboarding_screen/onboarding_screens.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 10;
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var duration = Duration(seconds: splashDelay);
    return Timer(duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool introSeen = (prefs.getBool('intro_seen') ?? false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnBoardingScreens()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8A2C8),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 290.h,
            ),
            SvgPicture.asset('assets/images/nlogo.svg'),
            const Spacer(),
            appText(
                inputText: 'POWERED BY POLARIS BANK',
                fontSize: 12.sp,
                weight: FontWeight.w500,
                colorName: AppColor.blackColor),
            SizedBox(
              height: 80.h,
            )
          ],
        ),
      ),
    );
  }
}
