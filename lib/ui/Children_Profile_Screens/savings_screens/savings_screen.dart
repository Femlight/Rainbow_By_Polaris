import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../Parent_Profile_Screens/settings/notification.dart';
import 'create_savings/create_savings_screen.dart';
import 'savings_screens_details.dart';

class ChildrenSavingsScreen extends StatefulWidget {
  const ChildrenSavingsScreen({super.key});

  @override
  State<ChildrenSavingsScreen> createState() => _ChildrenSavingsScreenState();
}

class _ChildrenSavingsScreenState extends State<ChildrenSavingsScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: ChildrenCustomAppBar(
        automaticallyImplyLeading: false,
        title: 'Savings',
        backgroundColor: AppColor.childrenAppBarColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.to(context, const NotificationScreen());
            },
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 34.h,
              ),
              Center(
                child: appText(
                    inputText: 'Total Savings',
                    fontSize: 16.sp,
                    weight: FontWeight.w400,
                    colorName: AppColor.textPrimary),
              ),
              SizedBox(
                height: 8.h,
              ),
              appText(
                  inputText: '\$22.00',
                  fontSize: 36.sp,
                  weight: FontWeight.w700,
                  colorName: AppColor.textPrimary),
              SizedBox(
                height: 23.h,
              ),
              const SavingsPod(),
              SizedBox(
                height: 60.h,
              ),
              const Interest(),
              SizedBox(
                height: 32.h,
              ),
              const Savings()
            ]),
      ),
    );
  }
}

class SavingsPod extends StatelessWidget {
  const SavingsPod({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.to(context, const CreateSavingsScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        width: 216.w,
        height: 46.h,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.primaryColor2),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.add),
            SizedBox(
              width: 12.w,
            ),
            appText(
                inputText: 'Create a savings pod',
                fontSize: 16.sp,
                weight: FontWeight.w700,
                colorName: AppColor.textPrimary),
          ],
        ),
      ),
    );
  }
}

class Interest extends StatelessWidget {
  const Interest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      width: 322.w,
      height: 76.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/Increase.png'),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText(
                  inputText: 'You are earning 3% interest',
                  fontSize: 16.sp,
                  weight: FontWeight.w700,
                  colorName: AppColor.textPrimary),
              appText(
                  inputText: 'That is about \$0.9',
                  fontSize: 14.sp,
                  weight: FontWeight.w400,
                  colorName: AppColor.textPrimary),
            ],
          )
        ],
      ),
    );
  }
}

class Savings extends StatefulWidget {
  const Savings({super.key});

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.to(context, const SavingsDetailsScreen());
      },
      child: Container(
        width: 322.w,
        height: 119.h,
        decoration: ShapeDecoration(
          color: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          children: [
            Container(
                width: 118.w,
                height: 119.h,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFFE9CA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                ),
                child: Image.asset('assets/images/piggy.png')),
            SizedBox(
              width: 21.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appText(
                    inputText: '\$22.00',
                    fontSize: 16.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 7.h,
                ),
                appText(
                    inputText: 'Regular Savings',
                    fontSize: 14.sp,
                    weight: FontWeight.w400,
                    colorName: AppColor.textPrimary),
                SizedBox(height: 10.h),
                isChecked
                    ? StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 85,
                        size: 11.h,
                        padding: 0,
                        selectedColor: AppColor.childrenAppBarColor,
                        unselectedColor: AppColor.childrenColor2,
                      )
                    : SizedBox(
                        height: 10.h,
                      ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppColor.childrenAppBarColor,
                        side: const BorderSide(color: AppColor.blackColor),
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        }),
                    appText(
                        inputText: 'Automatic Savings',
                        fontSize: 12.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.textPrimary),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
