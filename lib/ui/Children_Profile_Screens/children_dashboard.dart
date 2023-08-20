import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../Parent_Profile_Screens/close app/close_app.dart';
import 'home_screens/drawer/navigation_drawer.dart';
import 'home_screens/home_screen.dart';
import 'lesson_screens/lesson_screen.dart';
import 'savings_screens/savings_screen.dart';
import 'task_screens/task_screen.dart';

class ChildrenDashboard extends StatefulWidget {
  const ChildrenDashboard({super.key});

  @override
  State<ChildrenDashboard> createState() => _ChildrenDashboardState();
}

class _ChildrenDashboardState extends State<ChildrenDashboard> {
  final bool _canPop = false;
  final screens = [
    const ChildrenHomeScreen(),
    const ChildrenSavingsScreen(),
    const ChildrenLessonScreen(),
    const ChildrenTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
      child: Consumer<ChildrenDashboardScreenProvider>(
          builder: (context, childrenDashboardProvider, child) {
        return Scaffold(
           drawer: const NavigationDrawerView(),
            body: screens[childrenDashboardProvider.pageIndex],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: childrenDashboardProvider.pageIndex,
                onTap: (index) {
                  childrenDashboardProvider.newPageIndex = index;
                },
                elevation: 10.h,
                showUnselectedLabels: true,
                selectedFontSize: 10.sp,
                unselectedFontSize: 10.sp,
                selectedItemColor: AppColor.whiteColor,
                unselectedItemColor: AppColor.blackColor,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: "Home",
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/home.svg",
                          height: 30.h,
                          width: 30.h,
                          color: AppColor.primaryColor2,
                        ),
                        Container(
                          height: 2.h,
                          width: 31.w,
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor2),
                        )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/savings.svg",
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: "Savings",
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/savings.svg",
                          height: 30.h,
                          width: 30.h,
                          color: AppColor.primaryColor2,
                        ),
                        Container(
                          height: 2.h,
                          width: 31.w,
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor2),
                        )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/lesson.svg",
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: "Lesson",
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/lesson.svg",
                          height: 30.h,
                          width: 30.h,
                          color: AppColor.primaryColor2,
                        ),
                        Container(
                          height: 2.h,
                          width: 31.w,
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor2),
                        )
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/task.svg",
                      height: 30.h,
                      width: 30.h,
                    ),
                    label: "Task",
                    activeIcon: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/task.svg",
                          height: 30.h,
                          width: 30.h,
                          color: AppColor.primaryColor2,
                        ),
                        Container(
                          height: 2.h,
                          width: 31.w,
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor2),
                        )
                      ],
                    ),
                  ),
                ]));
      }),
    );
  }
}

class ChildrenDashboardScreenProvider extends ChangeNotifier {
  int _navIdex = 0;
  int get pageIndex => _navIdex;

  set newPageIndex(int index) {
    _navIdex = index;
    notifyListeners();
  }
}
