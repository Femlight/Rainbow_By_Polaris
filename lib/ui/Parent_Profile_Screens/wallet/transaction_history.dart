import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../settings/notification.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: CustomAppBar(
        title: 'Wallet',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: appText(
                      inputText: 'Generate Statement',
                      fontSize: 14.sp,
                      weight: FontWeight.w600,
                      colorName: AppColor.textPrimary),
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            appText(
                inputText: 'Transaction History',
                fontSize: 14.sp,
                weight: FontWeight.w600,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 54.w,
                  height: 39.h,
                  decoration: ShapeDecoration(
                    color: AppColor.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    Icons.trending_down,
                    color: AppColor.redColor,
                  ),
                ),
                appText(
                    inputText: 'Debbie’s weekly allowance',
                    fontSize: 14.sp,
                    weight: FontWeight.w600,
                    colorName: AppColor.textPrimary),
                appText(
                    inputText: '-\$25.00',
                    fontSize: 14.sp,
                    weight: FontWeight.w600,
                    colorName: AppColor.redColor),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 54.w,
                  height: 39.h,
                  decoration: ShapeDecoration(
                    color: AppColor.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    Icons.trending_down,
                    color: AppColor.redColor,
                  ),
                ),
                appText(
                    inputText: 'Debbie’s weekly allowance',
                    fontSize: 14.sp,
                    weight: FontWeight.w600,
                    colorName: AppColor.textPrimary),
                appText(
                    inputText: '-\$25.00',
                    fontSize: 14.sp,
                    weight: FontWeight.w600,
                    colorName: AppColor.redColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
