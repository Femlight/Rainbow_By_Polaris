import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import 'account_created_screen.dart';

class AddChildScreenWithNoExistingAccountAddPhoto extends StatefulWidget {
  const AddChildScreenWithNoExistingAccountAddPhoto({super.key});

  @override
  State<AddChildScreenWithNoExistingAccountAddPhoto> createState() =>
      _AddChildScreenWithNoExistingAccountAddPhotoState();
}

class _AddChildScreenWithNoExistingAccountAddPhotoState
    extends State<AddChildScreenWithNoExistingAccountAddPhoto> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController flightClassController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
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
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       AppNavigator.to(context, const NotificationScreen());
        //     },
        //     icon: const Badge(
        //       label: Text('30'),
        //       textColor: Colors.white,
        //       child: Icon(
        //         Icons.notifications,
        //         color: Colors.black,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 34.h,
            ),
            appText(
                inputText: 'Add Child',
                fontSize: 16.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 38.h,
            ),
            appText(
                inputText: 'Tell us about your child',
                fontSize: 14.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '1',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.primaryColor2),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor2,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '2',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.primaryColor2),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor2,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor2,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '3',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.whiteColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 43,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 293.w,
                height: 260.h,
                decoration: const ShapeDecoration(
                  color: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: AppColor.primaryColor2),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 50.h,
                    ),
                    const SizedBox(height: 19),
                    appText(
                        inputText: 'Take a photo of your child',
                        fontSize: 14.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.blackColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 74.h),
            BuildButton(
              onPressed: () {
                AppNavigator.to(context, const AccountCreatedScreen());
              },
              buttonText: 'DONE',
              containerHeight: 44.h,
              containerWidth: 189.w,
              borderRadiusSize: 0,
              buttonTextSize: 16.sp,
              buttonTextColor: Colors.white,
              buttonColor: AppColor.primaryColor2,
              borderColor: AppColor.primaryColor2,
              buttonTextWeight: FontWeight.w700,
              buttonTextFamily: 'Montserrat-Regular',
            ),
          ]),
        ),
      ),
    );
  }
}
