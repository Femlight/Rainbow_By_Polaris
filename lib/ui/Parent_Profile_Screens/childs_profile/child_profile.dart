import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/util.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../data/user_details/user_details_model.dart';
import '../../../service/services/get_user_details.dart';
import '../settings/notification.dart';
import '../settings/widgets/account_button.dart';
import '../task/create_task.dart';
import '../wallet/transaction_history.dart';
import '../wallet/transfer_page.dart';
import '../widgets/snackbar/top_snackbar.dart';
import '../widgets/widgets.dart';
import 'parent_Profile_children_task.dart';

class ChildProfile extends StatefulWidget {
  const ChildProfile(
      {super.key,
      required this.firstName,
      required this.accountNo,
      required this.id,
      required this.lastName});

  final String firstName;
  final String lastName;
  final String accountNo;
  final String id;
  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
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
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  radius: 50,
                  child: appText(
                      inputText: widget.firstName[0].toString() +
                          widget.lastName[0].toString(),
                      fontSize: 30.sp,
                      weight: FontWeight.w500,
                      colorName: AppColor.whiteColor),
                ),
                SizedBox(
                  height: 15.h,
                ),
                appText(
                    inputText: '${widget.lastName} ${widget.firstName}',
                    fontSize: 14.sp,
                    weight: FontWeight.w600,
                    colorName: AppColor.textPrimary),
                copyText(textToCopy: widget.accountNo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineContainer(
                  onTap: () {
                    AppNavigator.to(
                        context,
                        CreateTask(
                          firstName: widget.firstName.toString(),
                          id:  widget.id.toString(),
                        ));
                  },
                  text: 'Create task',
                  width: 133,
                  height: 45,
                  assetImage: 'assets/icons/create_task.svg',
                ),
                OutlineContainer(
                  onTap: () {
                    AppNavigator.to(context, const TransferPage());
                  },
                  text: 'Send allowance',
                  width: 160,
                  height: 45,
                  assetImage: 'assets/icons/send.svg',
                ),
              ],
            ),
            SizedBox(
              height: 71.h,
            ),
            AccountButton(
                onTap: () {
                  AppNavigator.to(
                      context, const ParentProfileChildrenTaskScreen());
                },
                text: 'Chores',
                icon: Icons.task_alt_outlined),
            AccountButton2(
                onTap: () {
                  // AppNavigator.to(context, const ParentalControlScreen());
                },
                text: 'Parental Control',
                icon: Icons.settings),
            AccountButton(
                onTap: () {
                  AppNavigator.to(context, const TransactionHistory());
                },
                text: 'Transaction History',
                icon: Icons.history),
          ],
        ),
      ),
    );
  }

  Row copyText({
    required String textToCopy,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        appText(
            inputText: textToCopy,
            fontSize: 12.sp,
            weight: FontWeight.w400,
            colorName: AppColor.textPrimary),
        IconButton(
            onPressed: () {
              _copyToClipboard(textToCopy: textToCopy);
            },
            icon: const Icon(Icons.copy))
      ],
    );
  }

  Future<void> _copyToClipboard({required String textToCopy}) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    // ignore: use_build_context_synchronously
    Messenger.success(context, 'Copied to clipboard');
  }
}
