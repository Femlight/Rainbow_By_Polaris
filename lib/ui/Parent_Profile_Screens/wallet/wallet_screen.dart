import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../settings/notification.dart';
import 'transaction_history.dart';
import 'widgets/wallet_balance_container.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<String> name = ['Deposit', 'To Debbie', 'To Amaka', 'Credit'];
  List<String> date = [
    'Dec 8,2023',
    'Oct 12, 1999',
    'Jan 14 2018',
    'Nov 23 2010'
  ];
  List<double> price = [30.00, 50.85, 1000.24, 100, 000.00];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: 'Wallet',
        backgroundColor: AppColor.primaryColor,
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
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Balance(),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 28.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 279.w,
                  height: 52.h,
                  decoration: ShapeDecoration(
                    color: AppColor.whiteColor,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 2, color: AppColor.primaryColor2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: appText(
                        inputText: 'Schedule Transfer',
                        fontSize: 14.sp,
                        weight: FontWeight.w600,
                        colorName: AppColor.textPrimary),
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  appText(
                      inputText: 'Transaction',
                      fontSize: 16.sp,
                      weight: FontWeight.w700,
                      colorName: AppColor.textPrimary),
                  TextButton(
                    onPressed: () {
                      AppNavigator.to(context, const TransactionHistory());
                    },
                    child: appText(
                        inputText: 'See All',
                        fontSize: 12.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.textPrimary),
                  )
                ],
              ),
              ListView.builder(
                  itemCount: name.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 286.w,
                      height: 65.h,
                      decoration: ShapeDecoration(
                        color: AppColor.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.trending_up_rounded,
                            color: Colors.green,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              appText(
                                  inputText: name[index],
                                  fontSize: 14.sp,
                                  weight: FontWeight.w500,
                                  colorName: AppColor.textPrimary),
                              appText(
                                  inputText: date[index],
                                  fontSize: 12.sp,
                                  weight: FontWeight.w400,
                                  colorName: AppColor.textPrimary)
                            ],
                          ),
                          appText(
                              inputText: price[index].toString(),
                              fontSize: 14.sp,
                              weight: FontWeight.w500,
                              colorName: AppColor.textPrimary),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
