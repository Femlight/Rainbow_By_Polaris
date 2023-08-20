import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../Parent_Profile_Screens/widgets/snackbar/top_snackbar.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: ChildrenCustomAppBar(
          automaticallyImplyLeading: true,
          title: 'Referrals',
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
          child: Column(children: [
            SizedBox(
              height: 42.h,
            ),
            Center(child: Image.asset('assets/images/referrals.png')),
            SizedBox(
              height: 16.h,
            ),
            appText(
                inputText: 'REFERRAL CODE',
                fontSize: 12.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: 216.w,
              height: 39.h,
              decoration: const ShapeDecoration(
                color: Color(0xFFFFE9CA),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFDA9A19),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  copyTex(textToCopy: 'PEO92378'),
                  IconButton(
                      onPressed: () {
                        Share.share('check out my website https://example.com');
                        // Share.share(
                        //   'Hello Welcome to FlutterCampus',
                        //   subject: 'Welcome Message',
                        // );
                      },
                      icon: const Icon(Icons.ios_share))
                ],
              ),
            ),
            SizedBox(
              height: 42.h,
            ),
            Column(
              children: [
                appText(
                    inputText: 'Reward System',
                    fontSize: 13.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 11.h,
                ),
                appText(
                    inputText:
                        '1. Get a friend to sign up using your Referral Code.',
                    fontSize: 12.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 10.h,
                ),
                appText(
                    inputText: '2. Get rewarded with rainbow points.',
                    fontSize: 12.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 11.h,
                ),
                appText(
                    inputText: '5 points = 500 naira',
                    fontSize: 13.sp,
                    weight: FontWeight.w300,
                    colorName: AppColor.textPrimary),
              ],
            ),
            SizedBox(
              height: 39.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReferralButton(
                  image: 'assets/images/People.png',
                  text: '2 referees',
                ),
                ReferralButton(
                  image: 'assets/images/point.png',
                  text: '15 points',
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: appText(
                  inputText: 'Redeem points',
                  fontSize: 12.sp,
                  weight: FontWeight.w700,
                  colorName: AppColor.primaryColor2),
            )
          ]),
        ));
  }

  Row copyTex({
    required String textToCopy,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        appText(
            inputText: textToCopy,
            fontSize: 12.sp,
            weight: FontWeight.w400,
            colorName: AppColor.textPrimary),
        IconButton(
            onPressed: () {
              _copyToClipboard(textToCopy: textToCopy);
            },
            icon: const Icon(Icons.copy))
      ],
    );
  }

  Future<void> _copyToClipboard({required String textToCopy}) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    // ignore: use_build_context_synchronously
    successTopSnackBar(context: context, message: 'Copied to clipboard');
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   duration: Duration(milliseconds: 500),
    //   content: Text('Copied "${textToCopy}" to clipboard'),
    // ));
  }
}

class ReferralButton extends StatelessWidget {
  const ReferralButton({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: 143.w,
      height: 59.h,
      decoration: const BoxDecoration(color: AppColor.whiteColor),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(
            width: 13,
          ),
          appText(
              inputText: text,
              fontSize: 12.sp,
              weight: FontWeight.w500,
              colorName: AppColor.textPrimary),
        ],
      ),
    );
  }
}
