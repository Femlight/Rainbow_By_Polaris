import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';

class PendingTask extends StatefulWidget {
  const PendingTask({super.key});

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74.h,
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              appText(
                  inputText: 'Wash car',
                  fontSize: 14.sp,
                  weight: FontWeight.w600,
                  colorName: AppColor.textPrimary),
              Container(
                width: 82.w,
                height: 23.h,
                decoration: const BoxDecoration(color: Color(0xFFDBECFF)),
                child: Center(
                  child: appText(
                      inputText: 'Debbie',
                      fontSize: 12.sp,
                      weight: FontWeight.w300,
                      colorName: AppColor.textPrimary),
                ),
              ),
            ],
          ),
          Container(
            width: 69.w,
            height: 29.h,
            decoration: ShapeDecoration(
              color: AppColor.primaryColor2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: appText(
                  inputText: 'Remind',
                  fontSize: 12.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
