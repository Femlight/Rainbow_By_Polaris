import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../data/data_storage/user_storage.dart';
import '../../../../data/dtos/user_profile/user_profile.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String lastName = UserStorage.retrieveLastName();
  String firstName = UserStorage.retrieveFirstName();
  String phoneNumber = UserStorage.retrievePhoneNumber();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
              inputText: 'First Name',
              fontSize: 12.sp,
              weight: FontWeight.w300,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 10.h,
            ),
            appText(
              inputText: firstName,
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            appText(
              inputText: 'Last Name',
              fontSize: 12.sp,
              weight: FontWeight.w300,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 10.h,
            ),
            appText(
              inputText: lastName,
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            appText(
              inputText: "Phone Number",
              fontSize: 12.sp,
              weight: FontWeight.w300,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 10.h,
            ),
            appText(
              inputText: phoneNumber,
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
