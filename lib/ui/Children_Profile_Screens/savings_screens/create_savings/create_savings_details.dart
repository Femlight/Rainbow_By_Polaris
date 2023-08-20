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
import '../widgets/monthly_modal.dart';
import '../widgets/weekly_modal.dart';

class CreateSavingsDetailsScreen extends StatefulWidget {
  const CreateSavingsDetailsScreen({super.key});

  @override
  State<CreateSavingsDetailsScreen> createState() =>
      _CreateSavingsDetailsScreenState();
}

class _CreateSavingsDetailsScreenState
    extends State<CreateSavingsDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  int currentDurationIndex = 0;
  bool isSelected = false;
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
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                inputText: 'How often do you want to save?',
                fontSize: 14.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 13.h,
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: timeTableForSaving.map((item) {
                var index = timeTableForSaving.indexOf(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentDurationIndex = index;
                    });
                    index == 1
                        ? showDialog(
                            context: context,
                            builder: (context) => const WeeklyModal())
                        : const SizedBox();
                    index == 2
                        ? showDialog(
                            context: context,
                            builder: (context) => const MonthlyModal())
                        : const SizedBox();
                    index == 0 ? print('Daily') : print('');
                    index == 1 ? print('Weekly') : print('');
                    index == 2 ? print('Monthly') : print('');
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
                inputText: 'Pick a savings timetable',
                fontSize: 10.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 50.h,
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
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                focusColor: AppColor.blackColor,
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                  } else {}
                });
              },
              validator: (value) {
                _amountController.text.isNotEmpty
                    ? const InterestSection()
                    : const InterestSection();
                print(value);
                return null;
              },
            ),
            SizedBox(
              height: 7.h,
            ),
            appText(
                inputText: 'Set an amount',
                fontSize: 10.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 49.h,
            ),
            const InterestSection()
          ]),
        ),
      ),
    );
  }
}

class InterestSection extends StatelessWidget {
  const InterestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(
                inputText: 'Interest Rate',
                fontSize: 13.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            appText(
                inputText: '5.0% per annum',
                fontSize: 13.sp,
                weight: FontWeight.w700,
                colorName: AppColor.textPrimary),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: AppColor.blackColor,
        ),
        SizedBox(
          height: 23.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(
                inputText: 'Maturity Date',
                fontSize: 13.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            appText(
                inputText: '10th December, 2023',
                fontSize: 13.sp,
                weight: FontWeight.w700,
                colorName: AppColor.textPrimary),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: AppColor.blackColor,
        ),
        SizedBox(
          height: 23.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(
                inputText: 'Frequency',
                fontSize: 13.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            appText(
                inputText: 'Every Friday',
                fontSize: 13.sp,
                weight: FontWeight.w700,
                colorName: AppColor.textPrimary),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: AppColor.blackColor,
        ),
        SizedBox(
          height: 23.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(
                inputText: 'Estimated Amount',
                fontSize: 13.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            appText(
                inputText: '10,000 NGN',
                fontSize: 13.sp,
                weight: FontWeight.w700,
                colorName: AppColor.greenColor),
          ],
        ),
        SizedBox(
          height: 116.h,
        ),
        Center(
          child: BuildButton(
            onPressed: () {
              // AppNavigator.to(context, const CreateSavingsDetailsScreen());
            },
            buttonText: 'Finish',
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
        SizedBox(
          height: 61.h,
        )
      ],
    );
  }
}
