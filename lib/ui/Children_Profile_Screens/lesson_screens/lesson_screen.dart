import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';

class ChildrenLessonScreen extends StatefulWidget {
  const ChildrenLessonScreen({super.key});

  @override
  State<ChildrenLessonScreen> createState() => _ChildrenLessonScreenState();
}

class _ChildrenLessonScreenState extends State<ChildrenLessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: ChildrenCustomAppBar(
          automaticallyImplyLeading: false,
          title: 'Lessons',
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
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 400.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Svg('assets/images/comingSoon.svg'),
                      ),
                    ),
                  ),
                  appText(
                      inputText: 'Coming Soon',
                      fontSize: 20.sp,
                      weight: FontWeight.w400,
                      colorName: AppColor.textPrimary),
                ],
              ),
            )));
  }
}
