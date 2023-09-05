import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/styles/app_text.dart';
import 'package:rainbow_by_polaris/core/util.dart';
import 'package:rainbow_by_polaris/data/data_storage/username_storage.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/custom_text_input.dart';
import '../../../core/widgets/loading_overlay_view.dart';
import '../../../data/data_storage/access_token_storage.dart';
import '../../../data/data_storage/biometric_storage.dart';
import '../../../data/dtos/login_user_dto/login_user_dto.dart';
import '../../../service/datasource.dart';
import '../../Parent_Profile_Screens/dashboard.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({
    super.key,
  });

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  bool obscurePassword = true;
  bool isLoading = false;
  Validators validators = Validators();
  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    String accessToken = AccessTokenStorage.retrieveToken();
    if (accessToken != '') {
      userNameController.text = UserNameStorage.retrieveUsername();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _letsAuthenticate();
      if (BiometricStorage.retrieveBiometric()) {
      } else {}
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
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

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final LoginUserDto request = LoginUserDto(
        username: userNameController.text.trim(),
        password: passwordController.text.trim(),
        isBiometricLogin: true,
      );
      final authSource = AuthDataSource();

      setState(() => isLoading = true);
      final result = await authSource.loginUser(request);
      setState(() => isLoading = false);
      result?.fold((l) {
        Messenger.error(context, l);
      }, (r) {
<<<<<<< HEAD

        AccessTokenStorage.storeToken(r.value.accessToken.toString());
=======
        AccessTokenStorage.storeToken(r.value!.accessToken.toString());
>>>>>>> 543e435eec2b6719e6f259af0216f997a4affae2
        UserNameStorage.storeUsername(userNameController.text);
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
          String accessToken = AccessTokenStorage.retrieveToken();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlayView(
      message: 'Logging in...',
      showOverLay: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppPadding.defaultPadding,
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200.h),
                    googleText(
                        inputText: 'Welcome back',
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
                      validator: (String? value) =>
                          validators.validateFields(value!),
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
                    SizedBox(height: 57.h),
                    BuildButton(
                      onPressed: submit,
                      buttonText: 'Login',
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
                    TextButton(
                        onPressed: () {},
                        child: googleText(
                            inputText: 'Forgot password',
                            fontSize: 12.sp,
                            weight: FontWeight.w500,
                            colorName: AppColor.blackColor)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _letsAuthenticate() async {
    bool isAuthenticated = await Authentication.authenticateWithBiometrics();
    if (isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const Dashboard(
                    // userProfileDto: userProfileDto,
                    )));
        String accessToken = AccessTokenStorage.retrieveToken();
      });
    } else {
    if(mounted) {
      Messenger.error(
          context, 'Please Enter Your Username and Password to Login...');
    }
    }
  }
}

class Authentication {
  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    bool isAuthenticated = false;
    if (isBiometricSupported && canCheckBiometrics) {
      List<BiometricType> biometricTypes =
          await localAuthentication.getAvailableBiometrics();

      isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Use your Fingerprint to Verify your Identity',
          options: const AuthenticationOptions(biometricOnly: true));
    }
    return isAuthenticated;
  }
}
