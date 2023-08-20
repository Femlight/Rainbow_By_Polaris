import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/styles/app_text.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/spacing.dart';
import '../../../data/dtos/user_profile/user_profile.dart';
import '../add_child_page/add_child_Screen.dart';
import '../childs_profile/child_profile.dart';
import '../settings/notification.dart';
import '../task/create_task.dart';
import '../wallet/transfer_page.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    this.userProfileDto,
    super.key,
  });
  final UserProfileDto? userProfileDto;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProfileDetails> details = [
    ProfileDetails(image: 'assets/images/advert.png', name: 'Peter'),
    ProfileDetails(image: 'assets/images/debbie.png', name: 'Debbie'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Stacey'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Joseph'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Mary'),
  ];
  final bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    print(widget.userProfileDto?.firstName.toString());
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                ),
                SizedBox(
                  width: 11.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                        inputText: 'Welcome back,',
                        fontSize: 12.sp,
                        weight: FontWeight.w400,
                        colorName: AppColor.textPrimary),
                    appText(
                        inputText: widget.userProfileDto!.lastName!,
                        fontSize: 12.sp,
                        weight: FontWeight.w600,
                        colorName: AppColor.textPrimary),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      AppNavigator.to(context, const NotificationScreen());
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColor.blackColor,
                    ))
              ],
            ),
            SizedBox(
              height: 38.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineContainer(
                  onTap: () {
                    AppNavigator.to(context, const CreateTask());
                  },
                  text: 'Create task',
                  width: 133,
                  height: 45,
                  assetImage: 'assets/icons/create_task.svg',
                ),
                OutlineContainer(
                  onTap: () {
                    AppNavigator.to(context, const TransferPage());
                  },
                  text: 'Send allowance',
                  width: 160,
                  height: 45,
                  assetImage: 'assets/icons/send.svg',
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.more_vert,
                //       color: AppColor.primaryColor2,
                //     ))
              ],
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                // controller: _scrollController1,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, _) => SizedBox(
                  width: 20.w,
                ),
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return buildAdvert(details: details[index], onTap: () {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    inputText: 'My Kids',
                    fontSize: 16.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                TextButton(
                    onPressed: () {
                      AppNavigator.to(context, const AddChildScreen1());
                    },
                    child: appText(
                        inputText: 'Add Child',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.textPrimary)),
              ],
            ),
            SizedBox(height: 20.h),
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
                        AppNavigator.to(context, const ChildProfile());
                      });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    inputText: 'Activity',
                    fontSize: 17.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                TextButton(
                    onPressed: () {},
                    child: appText(
                        inputText: 'See All',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.textPrimary)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 65.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Color(0xFF75229C)),
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/complete_task.svg'),
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Create Task for ',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Peter',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                  ),
                  appText(
                      inputText: 'Dec. 8, 2013',
                      fontSize: 12.sp,
                      weight: FontWeight.w400,
                      colorName: AppColor.textPrimary)
                ],
              ),
            )
          ],
        ),
      )),
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

Widget buildAdvert(
    {required ProfileDetails details, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Center(child: Image.asset('assets/images/advert.png')),
      ],
    ),
  );
}

class ProfileDetails {
  final String image;
  final String name;
  ProfileDetails({required this.image, required this.name});
}
