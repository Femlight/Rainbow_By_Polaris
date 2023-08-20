import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';

class SavingsDetailsScreen extends StatefulWidget {
  const SavingsDetailsScreen({super.key});

  @override
  State<SavingsDetailsScreen> createState() => _SavingsDetailsScreenState();
}

class _SavingsDetailsScreenState extends State<SavingsDetailsScreen> {
  bool autoSave = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: ChildrenCustomAppBar(
        automaticallyImplyLeading: true,
        title: 'New Skates',
        backgroundColor: AppColor.childrenAppBarColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {
              // AppNavigator.to(context, const NotificationScreen());
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 34.h,
                ),
                appText(
                    inputText: 'Savings Balance',
                    fontSize: 16.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 10.h,
                ),
                appText(
                    inputText: '\$18.00',
                    fontSize: 16.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Interest gained  ',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' +\$0.54',
                          style: TextStyle(
                              color: AppColor.greenColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText(
                            inputText: '85% Complete',
                            fontSize: 12.sp,
                            weight: FontWeight.w400,
                            colorName: AppColor.textPrimary,
                          ),
                          appText(
                            inputText: 'Target : \$25.00',
                            fontSize: 12.sp,
                            weight: FontWeight.w700,
                            colorName: AppColor.textPrimary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 85,
                        size: 11.h,
                        padding: 0,
                        selectedColor: AppColor.childrenAppBarColor,
                        unselectedColor: AppColor.grayColor,
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FundButton(
                            text: 'Add Funds',
                            onTap: () {},
                          ),
                          FundButton(
                            text: 'Withdraw',
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TilesSwitch(
                  prefixText: 'Auto Save',
                  value: autoSave,
                  onChanged: (value) => setState(() => autoSave = value),
                ),
                SizedBox(
                  height: 13.h,
                ),
                const Tiles(
                  prefixText: 'Interest Rate p.a',
                  suffixText: '3%',
                ),
                SizedBox(
                  height: 13.h,
                ),
                const Tiles(
                  prefixText: 'Savings Start Date',
                  suffixText: '12th April, 2022',
                ),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Row(
                    children: [
                      appText(
                        inputText: 'Recent Transactions',
                        fontSize: 16.sp,
                        weight: FontWeight.w700,
                        colorName: AppColor.textPrimary,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  width: double.infinity,
                  height: 55.h,
                  decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1E000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/csend.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      appText(
                        inputText: 'You added \$10.00 to New Skates',
                        fontSize: 16.sp,
                        weight: FontWeight.w700,
                        colorName: AppColor.textPrimary,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class FundButton extends StatelessWidget {
  const FundButton({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 119.w,
        height: 40.h,
        decoration: const ShapeDecoration(
          color: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.primaryColor2),
          ),
        ),
        child: Center(
          child: appText(
            inputText: text,
            fontSize: 16.sp,
            weight: FontWeight.w700,
            colorName: AppColor.textPrimary,
          ),
        ),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  const Tiles({
    Key? key,
    required this.prefixText,
    required this.suffixText,
  }) : super(key: key);
  final String prefixText;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.w),
      width: double.infinity,
      height: 55.h,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText(
            inputText: prefixText,
            fontSize: 16.sp,
            weight: FontWeight.w700,
            colorName: AppColor.textPrimary,
          ),
          appText(
            inputText: suffixText,
            fontSize: 16.sp,
            weight: FontWeight.w700,
            colorName: AppColor.textPrimary,
          ),
        ],
      ),
    );
  }
}

class TilesSwitch extends StatelessWidget {
  const TilesSwitch(
      {Key? key,
      required this.prefixText,
      required this.value,
      required this.onChanged})
      : super(key: key);
  final String prefixText;

  final bool value;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 37.w),
      width: double.infinity,
      height: 55.h,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText(
            inputText: prefixText,
            fontSize: 16.sp,
            weight: FontWeight.w700,
            colorName: AppColor.textPrimary,
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColor.warningColor,
          )
        ],
      ),
    );
  }
}
