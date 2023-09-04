import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../../childs_profile/child_profile.dart';

class AccountAddedScreen extends StatefulWidget {
  const AccountAddedScreen({super.key});

  @override
  State<AccountAddedScreen> createState() => _AccountAddedScreenState();
}

class _AccountAddedScreenState extends State<AccountAddedScreen> {
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
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Center(
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
                SizedBox(
                  height: 83.h,
                ),
                SvgPicture.asset('assets/images/celebration1.svg'),
                SizedBox(
                  height: 38.h,
                ),
                appText(
                    inputText: 'Profile Created Successfully.',
                    fontSize: 14.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 38.h,
                ),
                TextButton(
                  onPressed: () {
                    // AppNavigator.to(context, const ChildProfile());
                  },
                  child: appText(
                      inputText: 'View Profile',
                      fontSize: 16.sp,
                      weight: FontWeight.w500,
                      colorName: AppColor.primaryColor2,
                      textAlign: TextAlign.center),
                )
              ]),
        ),
      ),
    );
  }
}
