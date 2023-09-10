import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow_by_polaris/core/util.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/navigator.dart';
import '../../../../core/styles/app_text.dart';
import '../../../../core/styles/spacing.dart';
import '../../../../core/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/appbars/custom_appbar.dart';
import '../../../../core/widgets/custom_text_input.dart';
import 'account_added_screen.dart';

class AddChildScreenWithExistingAccount extends StatefulWidget {
  const AddChildScreenWithExistingAccount(
      {super.key,
      required this.firstName,
      required this.accountNo,
      required this.id,
      required this.lastName});
  final String firstName;
  final String lastName;
  final String accountNo;
  final String id;
  // File? _image;

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

  String selectedImagePath = '';
  String selectedImageName = '';
  String image = '';
  Future<void> getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        setState(() {
          selectedImagePath = image.path;
          selectedImageName = image.path.split('/').last;
        });
        // _uploadImage();
      } else {
        Messenger.success(context, 'No Image picked');
      }
    } on PlatformException catch (e) {}
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
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50))),
                          context: context,
                          builder: (context) => profileImagePicker());
                    },
                    child: Container(
                      height: 94.h,
                      width: 94.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: selectedImagePath.isEmpty
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: image.isEmpty
                                    ? const AssetImage(
                                        'assets/images/debbie.png')
                                    : Image.network(image).image,
                              )
                            : DecorationImage(
                                image:
                                    Image.file(File(selectedImagePath)).image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    )
                    //     CircleAvatar(
                    //   backgroundColor: AppColor.grayColor,
                    //   radius: 50,
                    //   child: image ==null
                    //       ? appText(
                    //           inputText: 'Add Photo',
                    //           fontSize: 10.sp,
                    //           weight: FontWeight.w500,
                    //           colorName: AppColor.textPrimary)
                    //       : Image.file(
                    //           File(selectedImagePath),
                    //         ),
                    // ),
                    ),
                SizedBox(
                  height: 10.h,
                ),
                appText(
                    inputText: 'Please Create a Profile for:',
                    fontSize: 12.sp,
                    weight: FontWeight.w500,
                    colorName: AppColor.textPrimary),
                SizedBox(
                  height: 12.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Account Name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: widget.firstName,
                        style: const TextStyle(
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
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Account Number: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: widget.accountNo,
                        style: const TextStyle(
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
                  controller: passwordController,
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
                  controller: confirmPasswordController,
                  preIconData: Icons.lock_rounded,
                  sufIconData: obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  onTapSuffixIcon: () {
                    toggleObscurePassword();
                    rebuildAllChildren(context);
                  },
                  validator: (String? value) =>
                      validators.validateConfirmPassword(
                          value: value, passwordEntry: passwordController.text),
                ),
                SizedBox(
                  height: 57.sp,
                ),
                BuildButton(
                  onPressed: () {
                    AppNavigator.to(context, const AccountAddedScreen());
                  },
                  buttonText: 'Done',
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

  Widget profileImagePicker() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 34.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          appText(
              inputText: 'Edit Profile Image',
              fontSize: 20.sp,
              weight: FontWeight.w500,
              colorName: AppColor.textPrimary),
          SizedBox(height: 15.h),
          buildImagePickerButton(
            onPressed: () async {
              await getImage(ImageSource.camera);
              // if(image != null){
              // _uploadImage();}
              Navigator.pop(context);
            },
            buttonText: 'Camera',
            pixIcon: Iconsax.camera,
          ),
          SizedBox(
            height: 20.h,
          ),
          buildImagePickerButton(
            buttonText: 'Gallery',
            pixIcon: Iconsax.gallery5,
            onPressed: () async {
              await getImage(ImageSource.gallery);
              // if(image != null){
              // _uploadImage();}
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget buildImagePickerButton(
      {required VoidCallback onPressed,
      required String buttonText,
      required IconData pixIcon}) {
    return SizedBox(
      height: 60.h,
      width: 366.w,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.58.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(pixIcon, color: AppColor.primaryColor),
                  SizedBox(
                    width: 18.w,
                  ),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: AppColor.textPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff292D32),
                size: 15.w,
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColor.grayColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
