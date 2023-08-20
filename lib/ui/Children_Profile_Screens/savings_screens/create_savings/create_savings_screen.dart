import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../../../Parent_Profile_Screens/settings/notification.dart';
import '../widgets/data.dart';
import '../widgets/durations.dart';
import 'create_savings_details.dart';

class CreateSavingsScreen extends StatefulWidget {
  const CreateSavingsScreen({super.key});

  @override
  State<CreateSavingsScreen> createState() => _CreateSavingsScreenState();
}

class _CreateSavingsScreenState extends State<CreateSavingsScreen> {
  int currentDurationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: ChildrenCustomAppBar(
        automaticallyImplyLeading: true,
        title: 'Savings',
        backgroundColor: AppColor.childrenAppBarColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.to(context, const NotificationScreen());
            },
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 59.h,
          ),
          appText(
              inputText: 'Let’s Start Saving!',
              fontSize: 20.sp,
              weight: FontWeight.w700,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 37.h,
          ),
          appText(
              inputText: 'What are you saving for?',
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              focusColor: AppColor.blackColor,
            ),
          ),
          appText(
              inputText: 'Give your savings pot a name',
              fontSize: 10.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 62.h,
          ),
          appText(
              inputText: 'How much did you want to save?',
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              focusColor: AppColor.blackColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          appText(
              inputText: 'Write your amount',
              fontSize: 10.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 59.h,
          ),
          appText(
              inputText: 'How long do you want to save for?',
              fontSize: 14.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 13.h,
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: durationForSaving.map((item) {
              var index = durationForSaving.indexOf(item);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentDurationIndex = index;
                  });
                },
                child: duration(
                    item, index == currentDurationIndex, context, 70, 31),
              );
            }).toList(),
          ),
          SizedBox(
            height: 13.h,
          ),
          appText(
              inputText: 'Pick a duration for your savings',
              fontSize: 10.sp,
              weight: FontWeight.w400,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 193.h,
          ),
          Center(
            child: BuildButton(
              onPressed: () {
                AppNavigator.to(context, const CreateSavingsDetailsScreen());
              },
              buttonText: 'Continue',
              containerHeight: 44.h,
              containerWidth: 273.w,
              borderRadiusSize: 0,
              buttonTextSize: 16.sp,
              buttonTextColor: Colors.white,
              buttonColor: AppColor.childrenAppBarColor,
              borderColor: AppColor.childrenAppBarColor,
              buttonTextWeight: FontWeight.w700,
              buttonTextFamily: 'Montserrat-Regular',
            ),
          ),
        ]),
      ),
    );
  }
}
