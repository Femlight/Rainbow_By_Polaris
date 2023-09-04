import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/service_locator.dart';
import 'package:rainbow_by_polaris/data/data_storage/password_storage.dart';
import 'package:rainbow_by_polaris/data/data_storage/username_storage.dart';
import 'package:rainbow_by_polaris/service/datasource.dart';
import 'package:rainbow_by_polaris/ui/Parent_Profile_Screens/dashboard.dart';
import 'core/provider/account_validation_provider.dart';
import 'data/data_storage/access_token_storage.dart';
import 'data/data_storage/biometric_storage.dart';
import 'data/data_storage/user_storage.dart';
import 'ui/Login_And_Signup_Screens/splashscreen/splash_screen.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await AccessTokenStorage.init();
  await UserStorage.init();
  await BiometricStorage.init();
  await UserNameStorage.init();
  await UserPasswordStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> DashboardScreenProvider(), lazy: true,),
        ChangeNotifierProvider(create: (_)=>  ValidateAccountProvider(authDataSource: locator<AuthDataSource>())),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          designSize: const Size(390, 844),
          builder: (context, child) {
            return MaterialApp(
                 debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColor.primaryColor2
              ),
              home: const SplashScreen(),
            );
          }),
    );
  }
}
