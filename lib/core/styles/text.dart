// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class AppText {
  AppText._();

  static TextStyle bold400(BuildContext context) {
    return GoogleFonts.poppins(
      color: AppColor.textPrimary,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle bold300(BuildContext context) {
    return GoogleFonts.poppins(
      color: AppColor.textPrimary,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    );
  }

  static TextStyle bold500(BuildContext context) {
    return GoogleFonts.poppins(
      color: AppColor.textPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  static TextStyle bold600(BuildContext context) {
    return GoogleFonts.poppins(
      color: AppColor.textPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }

  static TextStyle bold700(BuildContext context) {
    return GoogleFonts.poppins(
      color: AppColor.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
  }

  static TextStyle bold900(BuildContext context) {
    return GoogleFonts.poppins(
      color: AppColor.textPrimary,
      fontWeight: FontWeight.w900,
      fontSize: 14,
    );
  }
}
