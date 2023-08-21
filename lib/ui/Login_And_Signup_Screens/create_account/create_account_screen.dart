import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/util.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../core/widgets/custom_text_input.dart';
import '../../../core/widgets/loading_overlay_view.dart';
import '../../../data/dtos/create_account_dto/create_account_dto.dart';
import '../../../service/datasource.dart';
import '../../widgets/progress_dialog_widget.dart';
import '../account_created_screen.dart';

class CreateAccount extends StatefulWidget {
  final String value;
  const CreateAccount({
    super.key,
    required this.value,
  });

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool obscurePassword = true;
  bool isLoading = false;
  Validators validators = Validators();

  @override
  void initState() {
    super.initState();
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

  void updateLoadingState(bool state) {
    setState(() => isLoading = state);
    if (isLoading) {
      setState(() {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const ProgressDialog(
                message: 'Loading...',
              );
            });
      });
    } else {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final CreateAccountDto request = CreateAccountDto(
          customerId: widget.value,
          username: userNameController.text.trim(),
          password: confirmPasswordController.text.trim(),
          referralCode: '');
      final authSource = AuthDataSource();
      setState(() => isLoading = true);
      final result = await authSource.createUser(request);
      setState(() => isLoading = false);
      result?.fold((l) {
        Messenger.error(context, l);
      }, (r) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => const AccountCreated()));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final controller = context.watch<CreateAccountController>();
    return LoadingOverlayView(
      message: 'Creating Account....',
      showOverLay: isLoading,
      child: Scaffold(
        appBar: const CustomAppBar(title: ''),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100.h),
                  googleText(
                      inputText: 'Create an Account',
                      fontSize: 18.sp,
                      weight: FontWeight.w700,
                      colorName: AppColor.blackColor),
                  SizedBox(
                    height: 42.h,
                  ),
                  CustomTextInput(
                    hintText: "Username",
                    keyboardType: TextInputType.text,
                    controller: userNameController,
                    preIconData: Icons.person,
                  ),
                  SizedBox(
                    height: 57.h,
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
                    height: 57.h,
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
                            value: value,
                            passwordEntry: passwordController.text),
                  ),
                  SizedBox(
                    height: 57.h,
                  ),
                  BuildButton(
                    onPressed: submit,
                    //  () {
                    //   AppNavigator.pushReplacement(
                    //       context, const AccountCreated());
                    // },
                    buttonText: 'Next',
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
                ],
              )),
        )),
      ),
    );
  }
}
