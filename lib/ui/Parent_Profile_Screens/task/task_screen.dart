import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../settings/notification.dart';
import 'completed_task.dart';
import 'create_task.dart';
import 'pending_task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> grid = ['Pending Tasks', 'Completed Tasks'];

  List<Widget> body = [
    const PendingTask(),
    const CompletedTask(),
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: CustomAppBar(
          automaticallyImplyLeading: false,
          title: 'Tasks',
          backgroundColor: AppColor.primaryColor,
         
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
          child: Column(
            children: [
              SizedBox(
                height: 57.h,
              ),
              GestureDetector(
                onTap: () {
                  AppNavigator.to(context,  CreateTask(firstName: '', id: '',));
                },
                child: Center(
                  child: Container(
                    width: 279.w,
                    height: 52.h,
                    decoration: ShapeDecoration(
                      color: AppColor.whiteColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 2, color: AppColor.primaryColor2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: appText(
                          inputText: 'Create Task',
                          fontSize: 14.sp,
                          weight: FontWeight.w600,
                          colorName: AppColor.textPrimary),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: grid.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: appText(
                              inputText: grid[index],
                              fontSize: 14.sp,
                              weight: FontWeight.w600,
                              colorName: AppColor.textPrimary,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 190.w,
                                child: Divider(
                                  thickness: 2,
                                  color: current == index
                                      ? AppColor.primaryColor2
                                      : AppColor.appBackgroundColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ),
              // SizedBox(height: 40.h),
              body[current],
            ],
          ),
        ));
  }
}
