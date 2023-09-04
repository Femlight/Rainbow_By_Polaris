import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../data/data_storage/user_storage.dart';
import '../../../../data/dtos/user_profile/user_profile.dart';

class AccountData extends StatefulWidget {
  const AccountData({super.key,});


  @override
  State<AccountData> createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {

  String email= UserStorage.retrieveEmail();

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
              inputText: 'Email Address',
              fontSize: 12.sp,
              weight: FontWeight.w300,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 22.h,
            ),
            appText(
              inputText:email,
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
            SizedBox(height: 50.h),
            appText(
              inputText: 'Password',
              fontSize: 12.sp,
              weight: FontWeight.w300,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 22.h,
            ),
            appText(
              inputText: '**********',
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
            const SizedBox(
              height: 24,
            ),
            appText(
              inputText: 'Delete Account',
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary,
            ),
            SizedBox(
              height: 10.h,
            ),
            appText(
                inputText:
                    'Your account will be permanently deleted from the application. All your data will be lost.',
                fontSize: 12.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary,
                textAlign: TextAlign.justify),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: BuildButton(
                onPressed: () {
                  // AppNavigator.to(context, const CreateAccount());
                },
                buttonText: 'Delete Account',
                containerHeight: 44.h,
                containerWidth: 189.w,
                borderRadiusSize: 20,
                buttonTextSize: 16.sp,
                buttonTextColor: AppColor.redColor,
                buttonColor: const Color(0x5EE15F76),
                borderColor: const Color(0x5EE15F76),
                buttonTextWeight: FontWeight.w700,
                buttonTextFamily: 'Montserrat-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
