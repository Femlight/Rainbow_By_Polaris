import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/styles/app_text.dart';
import '../../../core/widgets/app_button.dart';

class CloseAppScreen extends StatefulWidget {
  const CloseAppScreen({Key? key}) : super(key: key);

  @override
  State<CloseAppScreen> createState() => _CloseAppScreenState();
}

class _CloseAppScreenState extends State<CloseAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          appText(
              inputText: 'Close Rainbow',
              fontSize: 20,
              weight: FontWeight.w600,
              colorName: AppColor.textPrimary,
              textAlign: TextAlign.center),
          SizedBox(
            height: 18.h,
          ),
          appText(
              inputText:
                  'Are you sure you want to close your Rainbow application',
              fontSize: 14,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary,
              textAlign: TextAlign.center),
          SizedBox(
            height: 23.h,
          ),
          BuildButton(
              onPressed: () => Navigator.of(context).pop(false),
              buttonText: 'No',
              containerHeight: 60,
              containerWidth: 366,
              borderRadiusSize: 1,
              buttonTextSize: 16,
              buttonTextColor: AppColor.whiteColor,
              buttonColor: AppColor.primaryColor,
              borderColor: AppColor.appBackgroundColor,
              buttonTextWeight: FontWeight.w700,
              buttonTextFamily: 'outfitBold'),
          SizedBox(
            height: 10.h,
          ),
          TextButton(
              child: appText(
                  inputText: 'Yes, Close',
                  fontSize: 14,
                  family: 'outfitRegular',
                  weight: FontWeight.w400,
                  colorName: Colors.red),
              onPressed: () => exit(0)),
        ],
      ),
    );
  }
}
