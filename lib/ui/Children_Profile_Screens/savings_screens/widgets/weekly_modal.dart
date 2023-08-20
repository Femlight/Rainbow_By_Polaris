import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/widgets/app_button.dart';
import 'data.dart';
import 'durations.dart';

class WeeklyModal extends StatefulWidget {
  const WeeklyModal({super.key});

  @override
  State<WeeklyModal> createState() => _WeeklyModalState();
}

class _WeeklyModalState extends State<WeeklyModal> {
  var currentDurationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          appText(
              inputText: 'What day of the week would you like to save?',
              fontSize: 13.sp,
              weight: FontWeight.w700,
              colorName: AppColor.textPrimary),
          appText(
              inputText: 'Choose your preferred day',
              fontSize: 13.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 65.h,
          )
        ],
      ),
      content: Wrap(
        spacing: 5,
        runSpacing: 10,
        children: weeklyModal.map((item) {
          var index = weeklyModal.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                currentDurationIndex = index;
              });
            },
            child: modal(item, index == currentDurationIndex, context, 80, 31),
          );
        }).toList(),
      ),
      actions: [
        Center(
          child: BuildButton(
            onPressed: () {
              Navigator.pop(context);
              // AppNavigator.to(context, const CreateSavingsDetailsScreen());
            },
            buttonText: 'Done',
            containerHeight: 30.h,
            containerWidth: 177.w,
            borderRadiusSize: 0,
            buttonTextSize: 16.sp,
            buttonTextColor: Colors.white,
            buttonColor: AppColor.childrenAppBarColor,
            borderColor: AppColor.childrenAppBarColor,
            buttonTextWeight: FontWeight.w700,
            buttonTextFamily: 'Montserrat-Regular',
          ),
        ),
        SizedBox(
          height: 31.h,
        )
      ],
    );
  }
}
