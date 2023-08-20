import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/size_config.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/styles/app_text.dart';
import '../login.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  int _currentIndex = 0;
  var currentIndex = 1;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          allowImplicitScrolling: true,
          //physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: tabs.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 53.w),
                  child: Row(
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            AppNavigator.to(context, const Login());
                            // _pageController.jumpToPage(2);
                          },
                          child:
                          appText(
                              inputText: 'Skip',
                              fontSize: 12.sp,
                              weight: FontWeight.w500,
                              colorName: AppColor.blackColor)
                          ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                    child: SvgPicture.asset(
                  tabs[index].assetImage,
                  height: 275.h,
                  width: 341.w,
                )),
                const Spacer(),
                Container(
                  height: 207.h,
                  width: double.infinity,
                  color: AppColor.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),

                      appText(
                          inputText: tabs[index].title,
                          fontSize: 14.sp,
                          weight: FontWeight.w400,
                          colorName: AppColor.blackColor),

                      SizedBox(
                        height: 50.h,
                      ),
                      BuildButton(
                        onPressed: () {
                          _currentIndex == 0 || _currentIndex == 1
                              ? _pageController.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.linear)
                              : AppNavigator.to(context, const Login());
                        },
                        buttonText: _currentIndex != 2 ? 'Next' : 'Done',
                        containerHeight: 31.h,
                        containerWidth: 109.w,
                        borderRadiusSize: 0,
                        buttonTextSize: 16.sp,
                        buttonTextColor: Colors.white,
                        buttonColor: AppColor.primaryColor2,
                        borderColor: AppColor.primaryColor2,
                        buttonTextWeight: FontWeight.w700,
                        buttonTextFamily: 'Montserrat-Regular',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          onPageChanged: (value) {
            _currentIndex = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class OnBoardingModel {
  final String assetImage;
  final String title;

  OnBoardingModel(
    this.assetImage,
    this.title,
  );
}

List<OnBoardingModel> tabs = [
  OnBoardingModel('assets/images/onboarding1.svg',
      'Teach your kids the importance of money'),
  OnBoardingModel(
      'assets/images/onboarding2.svg', 'Teach them how to save from young'),
  OnBoardingModel('assets/images/onboarding3.svg',
      '..... and watch your children become financial literates.'),
];
