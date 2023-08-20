import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rainbow_by_polaris/ui/Parent_Profile_Screens/dashboard.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({super.key});

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
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
                SvgPicture.asset('assets/images/e2mail.svg'),
                SizedBox(
                  height: 38.h,
                ),
                appText(
                    inputText:
                        'Your child’s account number\nwill be sent to the email\naddress you registered.',
                    fontSize: 14.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 38.h,
                ),
                TextButton(
                  onPressed: () {
                    AppNavigator.to(context, const Dashboard());
                  },
                  child: appText(
                      inputText: 'Return Home',
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
