import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/styles/app_text.dart';

class ProgressDialog extends StatelessWidget {
  final String message;
  const ProgressDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.whiteColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35.h, vertical: 20.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            CircularProgressIndicator(
              strokeWidth: 3.w,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColor.blackColor),
            ),
            SizedBox(
              width: 40.w,
            ),
            appText(
                inputText: message,
                fontSize: 16.sp,
                weight: FontWeight.w400,
                colorName: AppColor.textPrimary)
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rainbow/core/constants/colors.dart';
// import 'package:rainbow/core/styles/app_text.dart';

// class Dialogs {
//   static Future<void> progressDialog(BuildContext context, {GlobalKey? key}) {
//     return showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//               onWillPop: () async => true,
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 35.h, vertical: 20.w),
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(8)),
//                 child: Row(
//                   children: [
//                     CircularProgressIndicator(
//                       strokeWidth: 3.w,
//                       valueColor: const AlwaysStoppedAnimation<Color>(
//                           AppColor.blackColor),
//                     ),
//                     SizedBox(
//                       width: 40.w,
//                     ),
//                     appText(
//                         inputText: "Loading",
//                         fontSize: 16.sp,
//                         weight: FontWeight.w400,
//                         colorName: AppColor.textPrimary)
//                   ],
//                 ),
//               ));
//         });
//   }
// }
