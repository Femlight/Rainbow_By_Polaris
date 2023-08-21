import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/util.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../core/widgets/loading_overlay_view.dart';
import '../../../data/dtos/resend_otp/resend_otp.dart';
import '../../../data/dtos/validate_account_otp_dto/validate_account_otp_dto.dart';
import '../../../service/datasource.dart';

import '../../widgets/custom_flushbar_.dart';
import '../account_validated_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidateAccountWithOTP extends StatefulWidget {
  final String value;
  final String accoutNumber;
  const ValidateAccountWithOTP({
    super.key,
    required this.accoutNumber,
    required this.value,
  });

  @override
  State<ValidateAccountWithOTP> createState() => _ValidateAccountWithOTPState();
}

class _ValidateAccountWithOTPState extends State<ValidateAccountWithOTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _pinController;
  bool isLoading = false;
  final CustomFlushBar customFlushBar = CustomFlushBar();

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final request = ValidateAccountOtpDto(
          customerId: widget.value,
          otp: _pinController.text.trim(),
          accountNumber: widget.accoutNumber);
      final authSource = AuthDataSource();
      setState(() => isLoading = true);
      final response = await authSource.verifyAccountPhone(request);
      setState(() => isLoading = false);
      response!.fold((l) => Messenger.error(context, l), (r) {
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => AccountValidated(
                      value: widget.value,
                    )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlayView(
      message: 'Validating OTP...',
      showOverLay: isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(title: ''),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150.h),
                  googleText(
                      inputText: 'Enter OTP',
                      fontSize: 18.sp,
                      weight: FontWeight.w700,
                      colorName: AppColor.blackColor),
                  SizedBox(
                    height: 47.h,
                  ),
                  appText(
                      inputText:
                          'An OTP has been sent to the phone number associated with your account number',
                      fontSize: 12.sp,
                      weight: FontWeight.w400,
                      colorName: AppColor.blackColor,
                      textAlign: TextAlign.justify),
                  SizedBox(
                    height: 42.h,
                  ),
                  PinCodeTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    autoDisposeControllers: true,
                    enableActiveFill: true,
                    appContext: context,
                    obscureText: true,
                    blinkWhenObscuring: true,
                    blinkDuration: const Duration(seconds: 1),
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
                    height: 57.sp,
                  ),
                  BuildButton(
                    onPressed:
                        // () {
                        //   Navigator.push(
                        //       context,
                        //       CupertinoPageRoute(
                        //           builder: (context) => const AccountValidated(
                        //               // email: emailController.text.trim(),
                        //               )));
                        // },

                        submit,
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
                  SizedBox(height: 11.h),
                  RichText(
                    text: TextSpan(
                        text: 'Didn\'t receive OTP?',
                        style: const TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Send again',
                              style: const TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap = resend)
                        ]),
                  ),
                ],
              )),
        )),
      ),
    );
  }

  void resend() async {
    if (_formKey.currentState!.validate()) {
      final request = ResendOtpDto(
          userName: '', userId: widget.value, verificationType: '');
      final authSource = AuthDataSource();
      setState(() => isLoading = true);
      final response = await authSource.resendOtp(request);
      setState(() => isLoading = false);
      response!.fold((l) => Messenger.error(context, l), (r) {

      });
    }
  }
}
