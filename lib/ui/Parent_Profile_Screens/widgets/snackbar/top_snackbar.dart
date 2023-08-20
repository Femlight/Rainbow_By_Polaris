import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';
import 'custom_snack_bar.dart';

void successTopSnackBar(
    {required BuildContext context, required String message, custom_top_sa}) {
  showCustomSnackBar(
    context,
    Container(
      height: 60,
      margin: const EdgeInsets.only(
        left: 24,
      ),
      padding: const EdgeInsets.only(
        left: 26,
        right: 10,
      ),
      decoration: const BoxDecoration(
          color: AppColor.greenColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      child: Scaffold(
        backgroundColor: AppColor.greenColor,
        body: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const Icon(
                Icons.check_circle_rounded,
                color: AppColor.greenColor,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AutoSizeText(
                  message,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      fontSize: 14, color: AppColor.textPrimary),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
    curve: Curves.easeIn,
    reverseCurve: Curves.easeOut,
  );
}

void failureTopSnackBar({
  required BuildContext context,
  required String message,
}) {
  showCustomSnackBar(
    context,
    Container(
      height: 60.h,
      margin: EdgeInsets.only(
        left: 5.w,
      ),
      padding: EdgeInsets.only(
        left: 26.w,
        // right: 10.w,
      ),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 219, 136, 145),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 136, 145),
        body: Center(
          child: Row(
            children: [
              const Icon(
                Icons.cancel_rounded,
                color: AppColor.redColor,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AutoSizeText(
                  message,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      fontSize: 14, color: AppColor.textPrimary),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
    curve: Curves.easeIn,
    reverseCurve: Curves.easeOut,
  );
}

void warningTopSnackBar({
  required BuildContext context,
  required String message,
}) {
  showCustomSnackBar(
    context,
    Container(
      height: 60,
      margin: const EdgeInsets.only(
        left: 24,
      ),
      padding: const EdgeInsets.only(
        left: 26,
        right: 10,
      ),
      decoration: const BoxDecoration(
          color: AppColor.warningColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      child: Scaffold(
        backgroundColor: AppColor.warningColor,
        body: Row(
          children: [
            const Icon(
              Icons.error_rounded,
              color: AppColor.warningColor,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: AutoSizeText(
                message,
                maxLines: 2,
                style: GoogleFonts.roboto(
                    fontSize: 14, color: AppColor.textPrimary),
              ),
            )
          ],
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
    curve: Curves.easeIn,
    reverseCurve: Curves.easeOut,
  );
}
