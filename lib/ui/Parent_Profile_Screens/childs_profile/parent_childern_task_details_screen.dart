import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../settings/notification.dart';

class ParentProfileChildrenTaskDetailsScreen extends StatefulWidget {
  const ParentProfileChildrenTaskDetailsScreen({super.key});

  @override
  State<ParentProfileChildrenTaskDetailsScreen> createState() =>
      _ParentProfileChildrenTaskDetailsScreenState();
}

class _ParentProfileChildrenTaskDetailsScreenState
    extends State<ParentProfileChildrenTaskDetailsScreen> {
  List<ProfileDetails> details = [
    ProfileDetails(image: 'assets/images/advert.png', name: 'Peter'),
    ProfileDetails(image: 'assets/images/debbie.png', name: 'Debbie'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Stacey'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Joseph'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Mary'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: CustomAppBar(
        title: 'My Kids',
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 60.h,
          ),
          appText(
              inputText: 'Aaron’s Chores',
              fontSize: 16.sp,
              weight: FontWeight.w600,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              width: 314.w,
              height: 124.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText(
                      inputText: 'Wash daddy\'s Car',
                      fontSize: 16.sp,
                      weight: FontWeight.w600,
                      colorName: AppColor.textPrimary),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 263.w,
                    child: const StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 30,
                      size: 10,
                      padding: 0,
                      selectedColor: AppColor.greenColor,
                      unselectedColor: AppColor.grayColor,
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset('assets/icons/Star.svg'),
                      appText(
                          inputText: '30 Points',
                          fontSize: 13.sp,
                          weight: FontWeight.w400,
                          colorName: AppColor.textPrimary),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h),
          appText(
              inputText: 'Participants',
              fontSize: 16.sp,
              weight: FontWeight.w600,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(
                width: 20.w,
              ),
              itemCount: details.length,
              itemBuilder: (context, index) {
                return buildProfile(
                    details: details[index],
                    onTap: () {
                      // getControlDetails(id);
                    });
              },
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: AppColor.grayColor,
                child: Icon(Icons.add),
              )),
          SizedBox(height: 41.h),
          appText(
              inputText: 'Description',
              fontSize: 16.sp,
              weight: FontWeight.w600,
              colorName: AppColor.textPrimary),
          SizedBox(height: 16.h),
          appText(
              inputText: 'Wash the cars twice a week for this month.',
              fontSize: 12.sp,
              weight: FontWeight.w600,
              colorName: AppColor.textPrimary),
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuildButton(
                  onPressed: () {
                    // AppNavigator.to(context, const CreateAccount());
                  },
                  buttonText: 'EDIT',
                  containerHeight: 39.h,
                  containerWidth: 217.w,
                  borderRadiusSize: 5,
                  buttonTextSize: 14.sp,
                  buttonTextColor: AppColor.whiteColor,
                  buttonColor: AppColor.primaryColor2,
                  borderColor: AppColor.primaryColor2,
                  buttonTextWeight: FontWeight.w700,
                  buttonTextFamily: 'Montserrat-Regular',
                ),
                SizedBox(
                  height: 16.h,
                ),
                BuildButton(
                  onPressed: () {
                    // AppNavigator.to(context, const CreateAccount());
                  },
                  buttonText: 'DELETE',
                  containerHeight: 39.h,
                  containerWidth: 217.w,
                  borderRadiusSize: 5,
                  buttonTextSize: 14.sp,
                  buttonTextColor: AppColor.redColor,
                  buttonColor: const Color(0x5EE15F76),
                  borderColor: const Color(0x5EE15F76),
                  buttonTextWeight: FontWeight.w700,
                  buttonTextFamily: 'Montserrat-Regular',
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget buildProfile(
    {required ProfileDetails details, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset(details.image),
        ),
        appText(
            inputText: details.name,
            fontSize: 14.sp,
            weight: FontWeight.w500,
            colorName: AppColor.textPrimary)
      ],
    ),
  );
}

class ProfileDetails {
  final String image;
  final String name;
  ProfileDetails({required this.image, required this.name});
}
