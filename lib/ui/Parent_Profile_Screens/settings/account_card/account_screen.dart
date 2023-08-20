import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/widgets/app_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 272.w,
          height: 150.h,
          decoration: ShapeDecoration(
            color: AppColor.primaryColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 18.w,
                top: 75.h,
                child: appText(
                  inputText: 'AMAKA PETERS',
                  fontSize: 12.sp,
                  weight: FontWeight.w400,
                  colorName: AppColor.whiteColor,
                ),
              ),
              Positioned(
                left: 184.w,
                top: -33.h,
                child: SizedBox(
                  width: 109.w,
                  height: 108.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 11.h,
                        child: Container(
                          width: 88.w,
                          height: 88.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFAC4BB5),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13.w,
                        top: 11.w,
                        child: Container(
                          width: 88.w,
                          height: 88.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFC8A2C8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 11,
                        child: Container(
                          width: 88.w,
                          height: 88.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFE5F9),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 18.w,
                top: 104.h,
                child: SizedBox(
                  width: 230.w,
                  height: 15.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: appText(
                          inputText: 'Polaris Bank',
                          fontSize: 12.sp,
                          weight: FontWeight.w400,
                          colorName: AppColor.whiteColor,
                        ),
                      ),
                      Positioned(
                        left: 157.w,
                        top: 0,
                        child: appText(
                          inputText: '1020304050',
                          fontSize: 12.sp,
                          weight: FontWeight.w400,
                          colorName: AppColor.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 42.h),
        BuildButton(
          onPressed: () {
            // AppNavigator.pushReplacement(context, const AccountCreated());
          },
          buttonText: 'Add Account',
          containerHeight: 44.h,
          containerWidth: 189.w,
          borderRadiusSize: 20,
          buttonTextSize: 16.sp,
          buttonTextColor: AppColor.primaryColor2,
          buttonColor: AppColor.whiteColor,
          borderColor: AppColor.whiteColor,
          buttonTextWeight: FontWeight.w700,
          buttonTextFamily: 'Montserrat-Regular',
        ),
      ],
    );
  }
}
