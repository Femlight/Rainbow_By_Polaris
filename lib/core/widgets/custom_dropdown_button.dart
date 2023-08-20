import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import '../styles/app_text.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  final dynamic items;
  final dynamic color;
  final String hintText;
  final dynamic selectedValue;
  final Function(T?)? onChanged;
  const CustomDropDownButton({
    Key? key,
    this.items,
    this.color,
    required this.hintText,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: color ?? AppColor.primaryColor2,
            width: 1,
          ),
          color: AppColor.whiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<T>(
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        underline: const SizedBox(),
        hint: appText(
            inputText: hintText,
            fontSize: 16.sp,
            weight: FontWeight.w500,
            colorName: AppColor.textPrimary),
        style: TextStyle(
            fontSize: 16.sp,
            color: AppColor.textPrimary,
            fontWeight: FontWeight.w500),
        items: items,
        value: selectedValue,
        onChanged: onChanged,
      ),
    );
  }
}
