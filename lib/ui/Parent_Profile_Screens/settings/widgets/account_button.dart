import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final dynamic icon;
  final Color? textColor;
  final Color? iconColor;

  const AccountButton({
    Key? key,
    required this.text,
    this.onTap,
    this.icon,
    this.textColor,
    this.iconColor,
  }) : super(key: key);
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
            Icon(
              icon,
              color: iconColor ?? AppColor.textPrimary,
            ),
            SizedBox(width: 16.w),
            appText(
                inputText: text,
                fontSize: 16.sp,
                weight: FontWeight.w500,
                colorName: textColor ?? AppColor.textPrimary),
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

class AccountButton2 extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final dynamic icon;
  final Color? textColor;
  final Color? iconColor;
  bool? isComingSoon;
  AccountButton2({
    Key? key,
    required this.text,
    this.onTap,
    this.icon,
    this.textColor,
    this.iconColor,
    this.isComingSoon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    isComingSoon = false;
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
            Icon(
              icon,
              color: iconColor ?? AppColor.textPrimary,
            ),
            SizedBox(width: 16.w),
            appText(
                inputText: text,
                fontSize: 16.sp,
                weight: FontWeight.w500,
                colorName: textColor ?? AppColor.textPrimary),
            const Spacer(),
            Container(
              width: 93,
              height: 24,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Color(0xFFC8A2C8)),
              child: const Stack(
                children: [
                  Positioned(
                    left: 9,
                    top: 6,
                    child: Text(
                      'COMING SOON',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
