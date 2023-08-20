import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/styles/text.dart';

class NavigationDrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NavigationDrawerItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 44.h,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          color: AppColor.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppText.bold500(context).copyWith(
                fontSize: 16.sp,
                color: AppColor.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
