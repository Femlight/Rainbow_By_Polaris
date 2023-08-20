import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../data/dtos/user_profile/user_profile.dart';
import '../homepage/home_page.dart';
import 'account_card/account_and_card.dart';
import 'account_information/account_information.dart';
import 'notification.dart';
import 'widgets/account_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, this.userProfileDto});
  final UserProfileDto? userProfileDto;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: CustomAppBar(
          title: 'Settings',
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor,
          onBackPressed: () {
            AppNavigator.to(context, const HomeScreen());
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 79.h),
              appText(
                  inputText: 'General',
                  fontSize: 16.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.textPrimary),
              SizedBox(
                height: 13.h,
              ),
              AccountButton(
                  onTap: () {
                    AppNavigator.to(context, AccountInformation(userProfileDto: widget.userProfileDto));
                  },
                  text: 'Account Information',
                  icon: Icons.person_outline_outlined),
              AccountButton(
                  onTap: () {
                    AppNavigator.to(context, const AccountAndCardScreen());
                  },
                  text: 'Account and Card',
                  icon: Icons.account_balance_wallet),
              AccountButton2(
                  onTap: () {
                    // AppNavigator.to(context, const ParentalControlScreen());
                  },
                  text: 'Parental Control',
                  icon: Icons.settings),
              AccountButton(onTap: () {}, text: 'privacy', icon: Icons.key),
              AccountButton(
                  onTap: () {},
                  text: 'Notification',
                  icon: Icons.notifications_none),
              AccountButton(
                onTap: () {},
                text: 'Log Out',
                textColor: Colors.red,
                icon: Icons.logout,
                iconColor: Colors.red,
              ),
              SizedBox(
                height: 13.h,
              ),
              appText(
                  inputText: 'Support',
                  fontSize: 16.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.textPrimary),
              SizedBox(
                height: 13.h,
              ),
              AccountButton(
                  onTap: () {},
                  text: 'Report an issue',
                  icon: Icons.warning_amber_rounded),
              AccountButton(
                  onTap: () {}, text: 'FAQ', icon: Icons.help_outline_outlined),
            ],
          ),
        ));
  }
}
