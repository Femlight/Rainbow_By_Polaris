import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import 'account_screen.dart';
import 'card_screen.dart';

class AccountAndCardScreen extends StatefulWidget {
  const AccountAndCardScreen({super.key});

  @override
  State<AccountAndCardScreen> createState() => _AccountAndCardScreenState();
}

class _AccountAndCardScreenState extends State<AccountAndCardScreen> {
  List<String> grid = ['Accounts', 'Cards'];

  List<Widget> body = [const AccountScreen(), const CardScreen()];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: CustomAppBar(
          title: 'Accounts and Cards',
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
