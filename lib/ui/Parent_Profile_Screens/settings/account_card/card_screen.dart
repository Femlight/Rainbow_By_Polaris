import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/widgets/app_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 294.w,
          height: 133.h,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 294.w,
                  height: 133.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 233.w,
                top: 11.h,
                child: SizedBox(
                  width: 29.w,
                  height: 29.h,
                  child: SvgPicture.asset('assets/icons/Visa.svg'),
                ),
              ),
              Positioned(
                left: 26.w,
                top: 105.h,
                child: appText(
                  inputText: 'AMAKA PETERS',
                  fontSize: 10.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.blackColor,
                ),
              ),
              Positioned(
                left: 50.w,
                top: 57.h,
                child: appText(
                  inputText: '****     ****     ****   2978',
                  fontSize: 16.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.blackColor,
                ),
              ),
              Positioned(
                left: 216.w,
                top: 105.h,
                child: appText(
                  inputText: 'EXP: 05/27',
                  fontSize: 10.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.blackColor,
                ),
              ),
              Positioned(
                left: -24.w,
                top: -16.h,
                child: SizedBox(
                  width: 94.w,
                  height: 88.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 5.w,
                        top: 0,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0x72FFE9CA),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10.w,
                        top: 0,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0x662D333A),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 4.h,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0x72F58F66),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 244.w,
                top: 26.h,
                child: SizedBox(
                  width: 92.w,
                  height: 88.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 3.w,
                        top: 4.h,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFF58F66),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8.w,
                        top: 4.h,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0x72FFE9CA),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xA5A1CEAC),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 118.w,
                top: 83.h,
                child: SizedBox(
                  width: 89.w,
                  height: 92.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0x72FFE9CA),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.w,
                        top: 8.h,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0x5EDBECFF),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.w,
                        top: 0,
                        child: Container(
                          width: 84.w,
                          height: 84.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xA5A1CEAC),
                            shape: OvalBorder(),
                          ),
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
              buttonText: 'Add Card',
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
