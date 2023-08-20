import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../core/widgets/custom_dropdown_button.dart';
import '../../../core/widgets/text_input.dart';
import '../settings/notification.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? valueChoose;

  // List of items in our dropdown menu
  List items = [
    '10203040501',
    '10203040502',
    '10203040503',
    '10203040504',
    '10203040505',
  ];
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 61.h,
              ),
              appText(
                  inputText: 'Transfer Money',
                  fontSize: 16.sp,
                  weight: FontWeight.w600,
                  colorName: AppColor.textPrimary),
              SizedBox(
                height: 41.h,
              ),
              CustomDropDownButton(
                color: AppColor.whiteColor,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue.toString();
                  });
                },
                selectedValue: valueChoose,
                items: items.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                hintText: 'Choose Account',
              ),
              SizedBox(height: 30.h),
              const TextInputWithoutBorder(
                hintText: "Amount",
                keyboardType: TextInputType.number,
                // controller: userNameController,
                prefixText: 'N',
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomDropDownButton(
                color: AppColor.whiteColor,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue.toString();
                  });
                },
                selectedValue: valueChoose,
                items: items.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                hintText: 'Select Kid',
              ),
              SizedBox(
                height: 40.h,
              ),
              const TextInputWithoutBorder(
                hintText: "Reason",
                keyboardType: TextInputType.text,
                // controller: userNameController,
              ),
              SizedBox(
                height: 41.h,
              ),
              Center(
                child: BuildButton(
                  onPressed: () {
                    // AppNavigator.pushReplacement(context, const AccountCreated());
                  },
                  buttonText: 'Transfer',
                  containerHeight: 52.h,
                  containerWidth: double.infinity,
                  borderRadiusSize: 20,
                  buttonTextSize: 16.sp,
                  buttonTextColor: AppColor.blackColor,
                  buttonColor: AppColor.whiteColor,
                  borderColor: AppColor.primaryColor2,
                  buttonTextWeight: FontWeight.w700,
                  buttonTextFamily: 'Montserrat-Regular',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
