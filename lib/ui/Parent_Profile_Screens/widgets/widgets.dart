import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';

class OutlineContainer extends StatelessWidget {
  final String text;
  final String? assetImage;
  final double width;
  final double height;
  final Function()? onTap;

  const OutlineContainer({
    Key? key,
    required this.text,
    required this.assetImage,
    required this.width,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: width.w,
        height: height.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: AppColor.primaryColor2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(assetImage!),
            appText(
                inputText: text,
                fontSize: 14.sp,
                weight: FontWeight.w700,
                colorName: AppColor.primaryColor2)
          ],
        ),
      ),
    );
  }
}

class WalletContainer extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final dynamic icon;

  const WalletContainer(
      {Key? key, required this.text, this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65.w,
        height: 65.h,
        decoration: ShapeDecoration(
          color: AppColor.primaryColor2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColor.whiteColor,
            ),
            appText(
                inputText: text,
                fontSize: 10.sp,
                weight: FontWeight.w400,
                colorName: AppColor.whiteColor),
          ],
        ),
      ),
    );
  }
}
