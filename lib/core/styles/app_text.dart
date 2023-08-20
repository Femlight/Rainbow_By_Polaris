import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text appText({
  required String inputText,
  required double fontSize,
  String? family,
  required FontWeight weight,
  required Color colorName,
  bool? softWrap,
  double letterSpacing = 0.0,
  TextAlign? textAlign,
  TextOverflow? overflow,
}) {
  return Text(
    inputText,
    textAlign: textAlign,
    softWrap: softWrap,
    style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontFamily: family,
        fontWeight: weight,
        overflow: overflow,
        color: colorName),
  );
}

Text googleText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.inter(
        fontSize: fontSize, fontWeight: weight, color: colorName),
  );
}

AutoSizeText amountGeneralText({
  required String inputText,
  required double fontSize,
  String? family,
  required FontWeight weight,
  required Color colorName,
  bool? softWrap,
  double letterSpacing = 0.0,
  TextAlign? textAlign,
  TextOverflow? overflow,
}) {
  return AutoSizeText(
    inputText,
    textAlign: textAlign,
    softWrap: softWrap,
    maxLines: 1,
    style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontFamily: family,
        fontWeight: weight,
        overflow: overflow,
        color: colorName),
  );
}
