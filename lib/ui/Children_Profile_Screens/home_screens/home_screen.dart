import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';

class ChildrenHomeScreen extends StatefulWidget {
  const ChildrenHomeScreen({super.key});

  @override
  State<ChildrenHomeScreen> createState() => _ChildrenHomeScreenState();
}

class _ChildrenHomeScreenState extends State<ChildrenHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFAC4BB5),
              Color(0xFF5C32EB),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: AppPadding.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          CupertinoIcons.text_justifyleft,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Image.asset('assets/images/debbie.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Center(
                    child: Column(
                      children: [
                        appText(
                          inputText: 'Hi Debbie!',
                          fontSize: 24.sp,
                          weight: FontWeight.w400,
                          colorName: AppColor.whiteColor,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        appText(
                          inputText: 'Your available balance is',
                          fontSize: 16.sp,
                          weight: FontWeight.w400,
                          colorName: AppColor.whiteColor,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        appText(
                          inputText: '\$22.00',
                          fontSize: 36.sp,
                          weight: FontWeight.w700,
                          colorName: AppColor.whiteColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  appText(
                    inputText: 'Your daily spending limit is \$20',
                    fontSize: 10.sp,
                    weight: FontWeight.w400,
                    colorName: AppColor.whiteColor,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 15,
                    size: 31.h,
                    padding: 0,
                    roundedEdges: const Radius.circular(30),
                    selectedColor: AppColor.childrenColor,
                    unselectedColor: AppColor.whiteColor,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText(
                        inputText: 'Spent Balance:\$5',
                        fontSize: 12.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.whiteColor,
                      ),
                      appText(
                        inputText: 'Available Balance:\$15',
                        fontSize: 12.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.whiteColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoresReward(
                        text: 'CHORES',
                        task: '4 tasks left',
                        assetImage: 'assets/images/todo.png',
                        color: AppColor.childrenColor,
                      ),
                      ChoresReward(
                        text: 'REWARDS',
                        task: '40 points',
                        assetImage: 'assets/images/gift.png',
                        color: AppColor.childrenColor2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
                    width: double.infinity,
                    height: 97.h,
                    decoration: ShapeDecoration(
                      color: AppColor.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                          inputText: 'My new Skates!!',
                          fontSize: 15.sp,
                          weight: FontWeight.w700,
                          colorName: AppColor.textPrimary,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 85,
                          size: 16.h,
                          padding: 0,
                          selectedColor: AppColor.childrenColor,
                          unselectedColor: AppColor.childrenColor2,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'Remaining:',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' \$20',
                                      style: TextStyle(
                                          color: AppColor.redColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: '85%',
                                  style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Complete',
                                      style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    width: double.infinity,
                    height: 94.h,
                    decoration: ShapeDecoration(
                      color: AppColor.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/refer.png'),
                            SizedBox(
                              width: 17.w,
                            ),
                            appText(
                              inputText: 'Refer a friend and win!',
                              fontSize: 14.sp,
                              weight: FontWeight.w700,
                              colorName: AppColor.textPrimary,
                            ),
                          ],
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ChoresReward extends StatelessWidget {
  final String text;
  final String task;
  final Color? color;
  final String assetImage;
  const ChoresReward({
    Key? key,
    required this.text,
    required this.task,
    required this.assetImage,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 137.w,
      height: 80.h,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetImage,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText(
                inputText: text,
                fontSize: 14.sp,
                weight: FontWeight.w700,
                colorName: AppColor.blackColor,
              ),
              SizedBox(
                height: 19.h,
              ),
              appText(
                inputText: task,
                fontSize: 14.sp,
                weight: FontWeight.w700,
                colorName: AppColor.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
