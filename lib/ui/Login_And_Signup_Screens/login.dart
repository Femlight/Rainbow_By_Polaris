import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/ui/Login_And_Signup_Screens/login_user/welcome_back.dart';
import 'package:rainbow_by_polaris/ui/Login_And_Signup_Screens/validate_account/validate_account.dart';
import '../../core/constants/colors.dart';
import '../../core/helpers/navigator.dart';
import '../../core/widgets/app_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildButton(
                onPressed: () {
                  AppNavigator.to(context, const WelcomeBack());
                },
                buttonText: 'Login',
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
              SizedBox(
                height: 27.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: const TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign up',
                          style: const TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppNavigator.to(context, const ValidateAccount());
                            })
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
