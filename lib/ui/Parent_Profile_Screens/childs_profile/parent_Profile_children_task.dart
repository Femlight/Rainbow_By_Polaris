import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../settings/notification.dart';
import 'parent_childern_task_details_screen.dart';

class ParentProfileChildrenTaskScreen extends StatefulWidget {
  const ParentProfileChildrenTaskScreen({super.key});

  @override
  State<ParentProfileChildrenTaskScreen> createState() =>
      _ParentProfileChildrenTaskScreenState();
}

class _ParentProfileChildrenTaskScreenState
    extends State<ParentProfileChildrenTaskScreen> {
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
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.to(context, const NotificationScreen());
            },
            icon: const Badge(
              label: Text('30'),
              textColor: Colors.white,
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            appText(
                inputText: 'Aaron’s Chores',
                fontSize: 16.sp,
                weight: FontWeight.w600,
                colorName: AppColor.textPrimary),
            SizedBox(height: 5.h),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: 'Aaron ',
                  style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'has completed 2 of his chores for the week!',
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
            ),
            SizedBox(
              height: 25.h,
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.to(
                    context, const ParentProfileChildrenTaskDetailsScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                height: 73.h,
                decoration: const BoxDecoration(color: AppColor.whiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularStepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 30,
                      stepSize: 5,
                      selectedColor: AppColor.greenColor,
                      unselectedColor: AppColor.grayColor,
                      padding: 0,
                      width: 37,
                      height: 37,
                      selectedStepSize: 5,
                      roundedCap: (_, __) => true,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                            inputText: 'Wash Daddy cars',
                            fontSize: 14.sp,
                            weight: FontWeight.w600,
                            colorName: AppColor.textPrimary),
                        appText(
                            inputText: '30 points',
                            fontSize: 10.sp,
                            weight: FontWeight.w400,
                            colorName: AppColor.textPrimary),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline_outlined))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
