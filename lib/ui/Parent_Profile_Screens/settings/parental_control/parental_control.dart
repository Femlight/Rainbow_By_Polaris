import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../widgets/parental_button.dart';

class ParentalControlScreen extends StatefulWidget {
  const ParentalControlScreen({super.key});

  @override
  State<ParentalControlScreen> createState() => _ParentalControlScreenState();
}

class _ParentalControlScreenState extends State<ParentalControlScreen> {
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
        title: 'Parental Control',
        backgroundColor: AppColor.primaryColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 79.h),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, _) => SizedBox(
                  width: 20.w,
                ),
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return buildProfile(
                    details: details[index],
                    onTap: (){
                      // getControlDetails(id);
                    }
                  );
                },
              ),
            ),
            appText(
                inputText: 'Peters Account',
                fontSize: 16.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 13.h,
            ),
            ParentalButton(
              onTap: () {
                // AppNavigator.to(context, const AccountInformation());
              },
              text: 'Set Spending Limit',
              icon: Icons.person_outline_outlined,
              subText: '\$20 daily',
            ),
            ParentalButton(
              onTap: () {},
              text: 'Set Withdrawal Limit',
              icon: Icons.account_balance_wallet,
              subText: '\$100 daily',
            ),
            ParentalButton(
              onTap: () {},
              text: 'Allowance',
              icon: Icons.settings,
              subText: '\$60 daily',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfile({required ProfileDetails details, required  VoidCallback onTap}) {
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
}

class ProfileDetails {
  final String image;
  final String name;
  ProfileDetails({required this.image, required this.name});
}
