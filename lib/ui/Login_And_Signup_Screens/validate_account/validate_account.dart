import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/util.dart';
import 'package:rainbow_by_polaris/core/widgets/loading_overlay_view.dart';
import 'package:rainbow_by_polaris/data/dtos/validate_account_dto/validate_account_number_dto.dart';
import 'package:rainbow_by_polaris/service/datasource.dart';
import 'package:rainbow_by_polaris/ui/Login_And_Signup_Screens/validate_account_otp/validate_account_with_otp.dart';
import '../../../core/constants/colors.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../core/widgets/custom_text_input.dart';

import '../../widgets/custom_flushbar_.dart';

class ValidateAccount extends StatefulWidget {
  const ValidateAccount({super.key});

  @override
  State<ValidateAccount> createState() => _ValidateAccountState();
}

class _ValidateAccountState extends State<ValidateAccount> {
  final TextEditingController accountNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Validators validators = Validators();
  String customertypeid = '';

  final CustomFlushBar customFlushBar = CustomFlushBar();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    accountNumberController.dispose();
    super.dispose();
  }

  void submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final ValidateAccountNumberDto request = ValidateAccountNumberDto(
        accoutNumber: accountNumberController.text.trim(),
        customertypeid: '',
      );
      final authSource = AuthDataSource();
      setState(() => isLoading = true);
      final result = await authSource.validateAccount(request);
      setState(() => isLoading = false);

      result?.fold((l) {
        Messenger.error(context, l);
      }, (r) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ValidateAccountWithOTP(
                      accoutNumber: accountNumberController.text.trim(),
                      value: customertypeid,
                    )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlayView(
      message: 'Validating',
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
                  SizedBox(height: 200.h),
                  googleText(
                      inputText: 'Validate Account',
                      fontSize: 18.sp,
                      weight: FontWeight.w700,
                      colorName: AppColor.blackColor),
                  SizedBox(
                    height: 42.h,
                  ),
                  CustomTextInput(
                    hintText: "Enter A Polaris Account Number",
                    keyboardType: TextInputType.number,
                    controller: accountNumberController,
                    validator: (String? value) =>
                        validators.validateFields(value!),
                    preIconData: Icons.account_balance,
                    hasMaxLength: true,
                    maxLength: 10,
                  ),
                  SizedBox(
                    height: 57.sp,
                  ),
                  BuildButton(
                    onPressed: () {
                      submit();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ValidateAccountWithOTP(
                      //           accoutNumber: accountNumberController.text.trim(),
                      //           value: customertypeid,
                      //         )));
                    },
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
