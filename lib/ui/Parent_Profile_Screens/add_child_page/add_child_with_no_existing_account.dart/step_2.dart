import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import 'step_3.dart';

class AddChildScreenWithNoExistingAccountOTP extends StatefulWidget {
  const AddChildScreenWithNoExistingAccountOTP({super.key});

  @override
  State<AddChildScreenWithNoExistingAccountOTP> createState() =>
      _AddChildScreenWithNoExistingAccountOTPState();
}

class _AddChildScreenWithNoExistingAccountOTPState
    extends State<AddChildScreenWithNoExistingAccountOTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();
  StreamController<ErrorAnimationType>? _phoneNumberPinErrorController;

  String _phoneNumberPinText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: CustomAppBar(
        title: 'My Kids',
        backgroundColor: AppColor.primaryColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       AppNavigator.to(context, const NotificationScreen());
        //     },
        //     icon: const Badge(
        //       label: Text('30'),
        //       textColor: Colors.white,
        //       child: Icon(
        //         Icons.notifications,
        //         color: Colors.black,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 34.h,
            ),
            appText(
                inputText: 'Add Child',
                fontSize: 16.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 38.h,
            ),
            appText(
                inputText: 'Tell us about your child',
                fontSize: 14.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '1',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.primaryColor2),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor2,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor2,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '2',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.whiteColor),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor2,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '3',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.primaryColor2),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 58,
            ),
            appText(
                inputText: 'Enter OTP',
                fontSize: 18.sp,
                weight: FontWeight.w700,
                colorName: AppColor.blackColor),
            const SizedBox(
              height: 48,
            ),
            appText(
                inputText: 'An OTP has been sent to your email address',
                fontSize: 12.sp,
                weight: FontWeight.w400,
                colorName: AppColor.blackColor),
            SizedBox(
              height: 42.h,
            ),
            PinCodeTextField(
              autovalidateMode: AutovalidateMode.disabled,
              autoDisposeControllers: false,
              enableActiveFill: true,
              appContext: context,
              obscureText: true,
              blinkWhenObscuring: true,
              blinkDuration: const Duration(seconds: 1),
              onChanged: (value) async {
                setState(() {
                  _phoneNumberPinText = value;
                });
              },
              onCompleted: (value) {
                // _verifyEmail();
              },
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              pastedTextStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  // fontFamily: FontFamily.outfitRegular,
                  color: AppColor.blackColor),
              length: 6,
              animationType: AnimationType.slide,
              cursorColor: AppColor.primaryColor2,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 44.h,
                fieldWidth: 44.h,
                activeFillColor: AppColor.whiteColor,
                inactiveColor: AppColor.primaryColor2,
                activeColor: AppColor.primaryColor2,
                inactiveFillColor: AppColor.whiteColor,
                selectedFillColor: AppColor.whiteColor,
                selectedColor: AppColor.primaryColor2,
              ),
              validator: (v) {
                if (v!.length < 6) {
                  return "Kindly enter the 6 digit PIN sent to your phone number";
                } else {
                  return null;
                }
              },
              beforeTextPaste: (text) {
                return true;
              },
              controller: _pinController,
              animationDuration: const Duration(microseconds: 300),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 25.h,
            ),
            BuildButton(
              onPressed: () {
                AppNavigator.to(
                    context, const AddChildScreenWithNoExistingAccountAddPhoto());
              },
              buttonText: 'NEXT',
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
            SizedBox(height: 47.h),
            RichText(
              text: TextSpan(
                  text: 'Don\'t receive OTP?',
                  style: const TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Send again',
                        style: const TextStyle(
                            color: AppColor.primaryColor2,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // AppNavigator.to(
                            //     context, const AccountValidated());
                          })
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
