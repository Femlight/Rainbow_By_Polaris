import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../../../../data/dtos/user_profile/user_profile.dart';
import 'account_data.dart';
import 'personal_info.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key, this.userProfileDto});
  final UserProfileDto? userProfileDto;

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  List<String> grid = ['Account Data', 'Personal Info'];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      AccountData(userProfileDto: widget.userProfileDto),
      PersonalInfo(userProfileDto: widget.userProfileDto),
    ];

    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: CustomAppBar(
          title: 'Account Information',
          backgroundColor: AppColor.primaryColor,
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: grid.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: appText(
                              inputText: grid[index],
                              fontSize: 14.sp,
                              weight: FontWeight.w500,
                              colorName: AppColor.textPrimary,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 190.w,
                                child: Divider(
                                  thickness: 2,
                                  color: current == index
                                      ? AppColor.primaryColor2
                                      : AppColor.appBackgroundColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ),
              body[current],
            ],
          ),
        ));
  }
}
