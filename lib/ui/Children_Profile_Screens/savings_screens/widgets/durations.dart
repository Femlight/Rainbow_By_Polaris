import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';

Widget duration(String duration, bool isSelected, BuildContext context,
    double width, double height) {
  return Container(
    margin: EdgeInsets.only(right: 5.w),
    width: width.w,
    height: height.h,
    decoration: ShapeDecoration(
        color: isSelected ? AppColor.childrenAppBarColor : AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFAC4BB5)),
          borderRadius: BorderRadius.circular(5),
        )),
    child: Center(
      child: Text(duration,
          style: TextStyle(
            color: isSelected ? AppColor.whiteColor : AppColor.textPrimary,
            fontFamily: 'Roboto',
          )),
    ),
  );
}

Widget modal(String duration, bool isSelected, BuildContext context,
    double width, double height) {
  return Container(
    margin: EdgeInsets.only(right: 5.w),
    width: width.w,
    height: height.h,
    decoration: BoxDecoration(
      color:
          isSelected ? AppColor.childrenAppBarColor : const Color(0xFFF4F5F7),
    ),
    child: Center(
      child: Text(duration,
          style: TextStyle(
            fontSize: 13.sp,
            color: isSelected ? AppColor.whiteColor : AppColor.textPrimary,
            fontFamily: 'Roboto',
          )),
    ),
  );
}
