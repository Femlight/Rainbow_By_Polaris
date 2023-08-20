import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';

class ParentalButton extends StatelessWidget {
  final String text;
  final String subText;
  final Function()? onTap;
  final dynamic icon;
  final Color? textColor;
  final Color? iconColor;
  const ParentalButton(
      {Key? key,
      required this.text,
      required this.subText,
      this.onTap,
      required this.icon,
      this.textColor,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 65.h,
        decoration: const ShapeDecoration(
          color: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: Color(0xFFC8A2C8)),
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                    inputText: text,
                    fontSize: 16.sp,
                    weight: FontWeight.w500,
                    colorName: textColor ?? const Color(0xFFAC4BB5)),
                appText(
                    inputText: subText,
                    fontSize: 12.sp,
                    weight: FontWeight.w400,
                    colorName: textColor ?? AppColor.textPrimary),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}
