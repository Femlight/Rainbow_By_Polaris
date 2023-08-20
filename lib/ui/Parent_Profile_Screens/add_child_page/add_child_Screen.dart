import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../settings/notification.dart';
import 'add_child_with_existing_account_Screen.dart';
import 'add_child_with_no_existing_account.dart/step_1.dart';

class AddChildScreen1 extends StatefulWidget {
  const AddChildScreen1({super.key});

  @override
  State<AddChildScreen1> createState() => _AddChildScreen1State();
}

class _AddChildScreen1State extends State<AddChildScreen1> {
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
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.to(context, const NotificationScreen());
            },
            icon: const Badge(
              label: Text('30'),
              textColor: Colors.white,
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 34.h,
              ),
              appText(
                  inputText: 'Add Child',
                  fontSize: 16.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.textPrimary),
              SizedBox(height: 69.h),
              GestureDetector(
                onTap: () {
                  AppNavigator.to(context, const AddChildScreen());
                },
                child: Container(
                  width: 344.w,
                  height: 155.h,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/Girl.png'),
                      SizedBox(
                        height: 5.h,
                      ),
                      appText(
                          inputText:
                              'Add child with existing Polaris Rainbow\naccount',
                          fontSize: 12.sp,
                          weight: FontWeight.w500,
                          colorName: AppColor.textPrimary,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 86.h,
              ),
              GestureDetector(
                onTap: () {
                  AppNavigator.to(
                      context, const AddChildScreenWithNoExistingAccount());
                },
                child: Container(
                  width: 344.w,
                  height: 155.h,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/Girl.png'),
                      SizedBox(
                        height: 5.h,
                      ),
                      appText(
                          inputText: 'Add child with no existing account',
                          fontSize: 12.sp,
                          weight: FontWeight.w500,
                          colorName: AppColor.textPrimary),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
