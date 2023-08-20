import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import '../helpers/size_calculator.dart';
import '../styles/text.dart';

class CustomTextInput extends StatelessWidget {
  final String? hintText;
  final String? label;
  final dynamic onChanged;
  final dynamic onSaved;
  final Function()? onTapSuffixIcon;
  final dynamic validator;
  final bool obscureText;
  final bool hasMaxLength;
  final int? maxLength;
  final bool hasInputFormatter;
  final IconData? preIconData;
  final IconData? sufIconData;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? prefixText;
  final String? suffixText;
  final bool? inValidInfo;
  final TextEditingController? controller;

  const CustomTextInput(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.label,
      this.controller,
      this.obscureText = false,
      this.readOnly,
      this.prefixText,
      this.suffixText,
      this.onSaved,
      this.onTapSuffixIcon,
      this.validator,
      this.hasMaxLength = false,
      this.maxLength,
      this.hasInputFormatter = false,
      this.inputFormatter,
      this.keyboardType,
      this.inValidInfo,
      this.preIconData,
      this.sufIconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: maxLength,
          obscureText: obscureText,
          inputFormatters: inputFormatter,
          keyboardType: keyboardType,
          controller: controller,
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          onSaved: onSaved,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: AppText.bold500(context).copyWith(
            fontSize: 16,
          ),
          cursorColor: AppColor.blackColor,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: TextStyle(
                color: AppColor.textPrimary,
                fontWeight: FontWeight.w300,
                fontSize: 12.sp),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 0,
            ),
            fillColor: readOnly == true
                ? const Color(0xff141623).withOpacity(0.2)
                : const Color(0XFFFFFFFF).withOpacity(0.5),
            filled: true,
            hintText: hintText,
            prefixText: prefixText ?? '',
            prefixStyle: const TextStyle(
              color: Colors.black,
            ),
            suffixText: suffixText ?? '',
            suffixStyle: TextStyle(
              fontSize: sizer(true, 12, context),
            ),
            errorMaxLines: 5,
            counterText: "",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 12.sp),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor2,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor,
              ),
            ),
            prefixIcon: Icon(preIconData,
                size: 25, color: const Color.fromRGBO(151, 151, 151, 1)),
            suffixIcon: GestureDetector(
              onTap: onTapSuffixIcon,
              child: Icon(sufIconData,
                  size: 25, color: const Color.fromRGBO(151, 151, 151, 1)),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

class CustomTextInput2 extends StatelessWidget {
  final String? hintText;
  final String? label;
  final dynamic onChanged;
  final dynamic onSaved;
  final Function()? onTapSuffixIcon;
  final dynamic validator;
  final bool obscureText;
  final bool hasMaxLength;
  final int? maxLength;
  final bool hasInputFormatter;
  final IconData? preIconData;
  final IconData? sufIconData;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? prefixText;
  final String? suffixText;
  final bool? inValidInfo;
  final TextEditingController? controller;

  const CustomTextInput2(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.label,
      this.controller,
      this.obscureText = false,
      this.readOnly,
      this.prefixText,
      this.suffixText,
      this.onSaved,
      this.onTapSuffixIcon,
      this.validator,
      this.hasMaxLength = false,
      this.maxLength,
      this.hasInputFormatter = false,
      this.inputFormatter,
      this.keyboardType,
      this.inValidInfo,
      this.preIconData,
      this.sufIconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          inputFormatters: inputFormatter,
          keyboardType: keyboardType,
          controller: controller,
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          onSaved: onSaved,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: AppText.bold500(context).copyWith(
            fontSize: 16,
          ),
          cursorColor: AppColor.blackColor,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: TextStyle(
                color: AppColor.textPrimary,
                fontWeight: FontWeight.w300,
                fontSize: 12.sp),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            fillColor: readOnly == true
                ? const Color(0xff141623).withOpacity(0.2)
                : const Color(0XFFFFFFFF).withOpacity(0.5),
            filled: true,
            hintText: hintText,
            prefixText: prefixText ?? '',
            prefixStyle: const TextStyle(
              color: Colors.black,
            ),
            suffixText: suffixText ?? '',
            suffixStyle: TextStyle(
              fontSize: sizer(true, 12, context),
            ),
            errorMaxLines: 5,
            counterText: "",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 12.sp),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor2,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: onTapSuffixIcon,
              child: Icon(sufIconData,
                  size: 25, color: const Color.fromRGBO(151, 151, 151, 1)),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
