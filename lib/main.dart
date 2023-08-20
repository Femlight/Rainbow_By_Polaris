import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/ui/Parent_Profile_Screens/dashboard.dart';

import 'ui/Login_And_Signup_Screens/splashscreen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your apconst plication.
  @override
  build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_)=> DashboardScreenProvider(), lazy: true,)
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
              home: SplashScreen(),
            );
          }),
    );
  }
}
