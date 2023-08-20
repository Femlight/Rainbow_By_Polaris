import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/styles/text.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../../../../core/widgets/custom_text_input.dart';
import 'step_2.dart';

class AddChildScreenWithNoExistingAccount extends StatefulWidget {
  const AddChildScreenWithNoExistingAccount({super.key});

  @override
  State<AddChildScreenWithNoExistingAccount> createState() =>
      _AddChildScreenWithNoExistingAccountState();
}

class _AddChildScreenWithNoExistingAccountState
    extends State<AddChildScreenWithNoExistingAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController flightClassController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
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
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       AppNavigator.to(context, const NotificationScreen());
        //     },
        //     icon: const Badge(
        //       label: Text('30'),
        //       textColor: Colors.white,
        //       child: Icon(
        //         Icons.notifications,
        //         color: Colors.black,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 34.h,
            ),
            appText(
                inputText: 'Add Child',
                fontSize: 16.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 38.h,
            ),
            appText(
                inputText: 'Tell us about your child',
                fontSize: 14.sp,
                weight: FontWeight.w500,
                colorName: AppColor.textPrimary),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor2,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '1',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.whiteColor),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor2,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '2',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.primaryColor2),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColor.primaryColor2,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 22,
                  height: 22,
                  decoration: const ShapeDecoration(
                    color: AppColor.primaryColor,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: appText(
                        inputText: '3',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.primaryColor2),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 43,
            ),
            const CustomTextInput(
              hintText: "Email Address",
              keyboardType: TextInputType.emailAddress,
              // controller: emailAddressController,
              preIconData: Icons.email_outlined,
            ),
            SizedBox(
              height: 31.h,
            ),
            const CustomTextInput(
              hintText: "Phone Number",
              keyboardType: TextInputType.number,
              // controller: phoneNumberController,
              preIconData: Icons.phone_android_rounded,
            ),
            SizedBox(
              height: 31.h,
            ),
            const CustomTextInput(
              hintText: "BVN",
              keyboardType: TextInputType.number,
              // controller: bvnController,
              preIconData: Icons.account_balance_sharp,
            ),
            DateOfBirth(
                title: '',
                hintText: 'Date of Birth',
                controller: dateController,
                onTap: () async {
                  final date = await DateTimeUtils.pickDate(
                    context,
                    firstDate: DateTime.now(),
                  );
                  if (date == null) return;

                  dateController.text = DateTimeUtils.getDateStr(date);
                  // controller.setDepartureDate(date);
                }),
            SizedBox(
              height: 31.h,
            ),
            const CustomTextInput(
              hintText: "Referral Code (Optional)",
              keyboardType: TextInputType.emailAddress,
              // controller: emailAddressController,
              preIconData: Icons.mobile_friendly,
            ),
            SizedBox(
              height: 65.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    AppNavigator.to(context,
                        const AddChildScreenWithNoExistingAccountOTP());
                  },
                  child: appText(
                      inputText: 'NEXT',
                      fontSize: 14.sp,
                      weight: FontWeight.w800,
                      colorName: AppColor.primaryColor2),
                ),
                IconButton(
                    onPressed: () {
                      AppNavigator.to(context,
                          const AddChildScreenWithNoExistingAccountOTP());
                    },
                    icon: const Icon(Icons.arrow_forward))
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class DateOfBirth extends StatelessWidget {
  const DateOfBirth({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.onTap,
    this.disabled = false,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final Function() onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(1),
      borderSide: const BorderSide(
        color: AppColor.primaryColor,
      ),
    );

    final field = TextFormField(
      controller: controller,
      readOnly: true,
      onTap: disabled ? () {} : onTap,
      style: AppText.bold400(context).copyWith(
        fontSize: 13,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: AppText.bold400(context).copyWith(
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: border,
        enabledBorder: border,
        prefixIcon: const Icon(Icons.calendar_month),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColor.primaryColor2,
          ),
        ),
      ),
    );

    final titlestyle = AppText.bold600(context).copyWith(
      fontSize: 14,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titlestyle,
        ),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
