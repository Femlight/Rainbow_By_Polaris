import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/helpers/navigator.dart';
import '../../core/styles/app_text.dart';
import '../../core/styles/spacing.dart';
import '../../core/widgets/app_button.dart';
import 'create_account/create_account_screen.dart';

class AccountValidated extends StatefulWidget {
  final String value;
  const AccountValidated({
    super.key,
    required this.value,
  });

  @override
  State<AccountValidated> createState() => _AccountValidatedState();
}

class _AccountValidatedState extends State<AccountValidated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 300.h),
              googleText(
                  inputText: 'Account Validated',
                  fontSize: 18.sp,
                  weight: FontWeight.w700,
                  colorName: AppColor.blackColor),
              SizedBox(
                height: 47.h,
              ),
              appText(
                  inputText: 'Your account has been successfully validated',
                  fontSize: 12.sp,
                  weight: FontWeight.w400,
                  colorName: AppColor.blackColor,
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 42.h,
              ),
              BuildButton(
                onPressed: () {
                  AppNavigator.pushReplacement(
                      context,
                      CreateAccount(
                        value: widget.value,
                      ));
                },
                buttonText: 'Next',
                containerHeight: 44.h,
                containerWidth: 189.w,
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
