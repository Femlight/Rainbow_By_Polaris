import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';

class ChildrenTaskScreen extends StatefulWidget {
  const ChildrenTaskScreen({super.key});

  @override
  State<ChildrenTaskScreen> createState() => _ChildrenTaskScreenState();
}

class _ChildrenTaskScreenState extends State<ChildrenTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: ChildrenCustomAppBar(
          automaticallyImplyLeading: false,
          title: 'Earnings',
          backgroundColor: AppColor.childrenAppBarColor,
          onBackPressed: () {
            Navigator.pop(context);
          },
          actions: [
            IconButton(
              onPressed: () {
                // AppNavigator.to(context, const NotificationScreen());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 27.h,
              ),
              Center(
                child: Column(
                  children: [
                    appText(
                        inputText: '\$20.00',
                        fontSize: 36.sp,
                        weight: FontWeight.w700,
                        colorName: AppColor.textPrimary),
                    appText(
                        inputText: 'To be paid on Friday',
                        fontSize: 16.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.textPrimary),
                    appText(
                        inputText: '\$32.00 if all tasks are completed',
                        fontSize: 16.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.textPrimary),
                  ],
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              appText(
                  inputText: 'TASK',
                  fontSize: 16.sp,
                  weight: FontWeight.w700,
                  colorName: AppColor.textPrimary),
              SizedBox(
                height: 16.h,
              ),
              // ListView.builder(itemBuilder: itemBuilder)
              checkItemBuilder(context, 'Clean Bed', 'Weekly'),
              
            ],
          ),
        ));
  }
}

Widget checkItemBuilder(
  BuildContext context,
  String task,
  String frequency,
) {
  bool checked = false;

  return Container(
      width: double.infinity,
      height: 56.h,
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
      child: Row(children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8),
            child: StatefulBuilder(builder: (context, setState) {
              return Checkbox(
                  activeColor: AppColor.childrenAppBarColor,
                  side: const BorderSide(color: AppColor.blackColor),
                  value: checked,
                  onChanged: (newVal) {
                    setState(() {
                      checked = !checked;
                    });
                  });
            })),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appText(
                inputText: task,
                fontSize: 16.sp,
                weight: FontWeight.w700,
                colorName: AppColor.textPrimary),
            appText(
                inputText: frequency,
                fontSize: 12.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
          ],
        ))
      ]));
}
