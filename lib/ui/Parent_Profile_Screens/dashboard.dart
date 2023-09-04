import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../data/dtos/login_user_dto/login_user_response_model.dart';
import '../../data/user_details/user_details_model.dart';
import '../../service/services/get_user_details.dart';
import 'close app/close_app.dart';
import 'homepage/home_page.dart';
import 'settings/settings.dart';
import 'task/task_screen.dart';
import 'wallet/wallet_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key, this.userProfileDto,
  });
  final UserDto? userProfileDto;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bool _canPop = false;
  // late UserDetailsResponseModelDto userDetailsResponseModelDto;
//   Future<UserDetailsResponseModelDto?> getUserDetails() async {
//     var userDetailsResponseModelDto = await UserDetailService.getUserDetails();
// print(userDetailsResponseModelDto!.value!.childDetailsViewModel!.first);
//     return null;
//   }

  @override
  void initState() {
    super.initState();
    // getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
       HomeScreen(),
      const WalletScreen(),
      const TaskScreen(),
      const SettingsScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (_canPop) {
          return true;
        } else {
          showModalBottomSheet(
              isScrollControlled: true,
              isDismissible: true,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              builder: (context) => const CloseAppScreen());
          return false;
        }
      },
      child: Consumer<DashboardScreenProvider>(
          builder: (context, dashboardProvider, child) {
        return Scaffold(
          body: screens[dashboardProvider.pageIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: dashboardProvider.pageIndex,
            onTap: (index) {
              dashboardProvider.newPageIndex = index;
            },
            elevation: 10,
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColor.textPrimary),
            showUnselectedLabels: true,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedItemColor: AppColor.whiteColor,
            unselectedItemColor: AppColor.blackColor,
            items: [
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                  ),
                ),
                label: "Home",
                activeIcon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: AppColor.primaryColor,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/wallet.svg",
                  ),
                ),
                label: "Wallet",
                activeIcon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: AppColor.primaryColor,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/wallet.svg",
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/task.svg",
                  ),
                ),
                label: "task",
                activeIcon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: AppColor.primaryColor,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/task.svg",
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/settings.svg",
                  ),
                ),
                label: "Settings",
                activeIcon: AnimatedContainer(
                  width: 60.w,
                  height: 60.h,
                  padding: EdgeInsets.all(
                    12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: AppColor.primaryColor,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    "assets/icons/settings.svg",
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class DashboardScreenProvider extends ChangeNotifier {
  int _navIdex = 0;
  int get pageIndex => _navIdex;

  set newPageIndex(int index) {
    _navIdex = index;
    notifyListeners();
  }
}
