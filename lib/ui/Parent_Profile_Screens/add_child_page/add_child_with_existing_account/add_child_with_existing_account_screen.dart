import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../../../../core/widgets/custom_text_input.dart';
import '../../settings/notification.dart';
import 'account_added_screen.dart';

class AddChildScreenWithExistingAccount extends StatefulWidget {
  const AddChildScreenWithExistingAccount({super.key});

  @override
  State<AddChildScreenWithExistingAccount> createState() =>
      _AddChildScreenWithExistingAccountState();
}

class _AddChildScreenWithExistingAccountState
    extends State<AddChildScreenWithExistingAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController accountNumberController;
  late final TextEditingController emailAddressController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool obscurePassword = true;
  Validators validators = Validators();
  @override
  void initState() {
    super.initState();
    accountNumberController = TextEditingController();
    emailAddressController = TextEditingController();
    phoneNumberController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    setState(() {});
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

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
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 34.h,
                ),
                appText(
                    inputText: 'Add Child',
                    fontSize: 16.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 48.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: AppColor.grayColor,
                    radius: 35,
                    child: appText(
                        inputText: 'Add Photo',
                        fontSize: 10.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.textPrimary),
                  ),
                ),
                appText(
                    inputText: 'Please Create a Profile for:',
                    fontSize: 10.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 12.h,
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Account Name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Aaron Peters',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Account Number: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '1020304050',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 47.h,
                ),
                const CustomTextInput(
                  hintText: "Child Account Number",
                  keyboardType: TextInputType.number,
                  // controller: accountNumberController,
                  preIconData: Icons.account_balance,
                ),
                SizedBox(
                  height: 31.h,
                ),
                const CustomTextInput(
                  hintText: "Child Email Address",
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
                  preIconData: Icons.phone_android_sharp,
                ),
                SizedBox(
                  height: 31.h,
                ),
                const CustomTextInput(
                  hintText: "Username",
                  keyboardType: TextInputType.text,
                  // controller: usernameController,
                  preIconData: Icons.person,
                ),
                SizedBox(
                  height: 31.h,
                ),
                CustomTextInput(
                  hintText: "Password",
                  keyboardType: TextInputType.text,
                  obscureText: obscurePassword,
                  // controller: passwordController,
                  preIconData: Icons.lock_rounded,
                  sufIconData: obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  onTapSuffixIcon: () {
                    toggleObscurePassword();
                    rebuildAllChildren(context);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 31.h,
                ),
                CustomTextInput(
                  hintText: "Confirm Password",
                  keyboardType: TextInputType.text,
                  obscureText: obscurePassword,
                  // controller: confirmPasswordController,
                  preIconData: Icons.lock_rounded,
                  sufIconData: obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  onTapSuffixIcon: () {
                    toggleObscurePassword();
                    rebuildAllChildren(context);
                  },

                  // validator: (String? value) =>
                  //     validators.validateConfirmPassword(
                  //         value: value, passwordEntry: passwordController.text),
                ),
                SizedBox(
                  height: 57.sp,
                ),
                BuildButton(
                  onPressed: () {
                    AppNavigator.to(context, const AccountAddedScreen());
                  },
                  buttonText: 'Generate',
                  containerHeight: 44.h,
                  containerWidth: 189.w,
                  borderRadiusSize: 0,
                  buttonTextSize: 16.sp,
                  buttonTextColor: Colors.white,
                  buttonColor: AppColor.primaryColor2,
                  borderColor: AppColor.primaryColor2,
                  buttonTextWeight: FontWeight.w700,
                  buttonTextFamily: 'Montserrat-Regular',
                ),
              ]),
        ),
      ),
    );
  }
}
