import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../core/constants/colors.dart';
import '../../core/helpers/navigator.dart';
import '../../core/styles/app_text.dart';
import '../../core/styles/spacing.dart';
import '../../core/widgets/app_button.dart';
import 'login_user/welcome_back.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({super.key});

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              googleText(
                  inputText: 'Account Created successfully',
                  fontSize: 18.sp,
                  weight: FontWeight.w700,
                  colorName: AppColor.blackColor),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 400.h,
                width: 341.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Svg('assets/images/account_created.svg'),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              BuildButton(
                onPressed: () {
                  AppNavigator.pushReplacement(context, const WelcomeBack());
                },
                buttonText: 'Next',
                containerHeight: 44.h,
                containerWidth: 284.w,
                borderRadiusSize: 0,
                buttonTextSize: 16.sp,
                buttonTextColor: Colors.white,
                buttonColor: AppColor.primaryColor2,
                borderColor: AppColor.primaryColor2,
                buttonTextWeight: FontWeight.w700,
                buttonTextFamily: 'Montserrat-Regular',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
