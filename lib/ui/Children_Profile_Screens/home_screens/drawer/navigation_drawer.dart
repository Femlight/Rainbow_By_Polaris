import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../settings/referral_screen.dart';
import 'components/drawer_header_component.dart';
import 'widgets/navigation_drawer_item.dart';

class NavigationDrawerView extends StatefulWidget {
  const NavigationDrawerView({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerView> createState() => _NavigationDrawerViewState();
}

class _NavigationDrawerViewState extends State<NavigationDrawerView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.appBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const DrawerHeaderComponent(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NavigationDrawerItem(
                      title: 'Task History',
                      onPressed: () {
                        // Navigator.pop(context);
                        // AppNavigator.to(
                        //     context, const GolfClubMembershipScreen());
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    NavigationDrawerItem(
                      title: 'Referral Program',
                      onPressed: () {
                        Navigator.pop(context);
                        AppNavigator.to(context, const ReferralScreen());
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    NavigationDrawerItem(
                      title: 'Saved Lessons',
                      onPressed: () {
                        // Navigator.pop(context);
                        // AppNavigator.to(
                        //     context, const GolfClubMembershipScreen());
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    NavigationDrawerItem(
                      title: 'Feedback',
                      onPressed: () {
                        // Navigator.pop(context);
                        // AppNavigator.to(
                        //     context, const GolfClubMembershipScreen());
                      },
                    ),
                    SizedBox(
                      height: 198.h,
                    ),
                    Container(
                      width: 148.w,
                      height: 44.h,
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Center(
                        child: appText(
                          inputText: 'Log Out',
                          fontSize: 16.sp,
                          weight: FontWeight.w500,
                          colorName: AppColor.redColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
