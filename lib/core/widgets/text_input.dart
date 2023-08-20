import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../helpers/size_calculator.dart';
import '../styles/text.dart';

class TextInputWithoutBorder extends StatelessWidget {
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

  const TextInputWithoutBorder(
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
          textAlign: TextAlign.center,
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
            labelStyle: TextStyle(
                color: AppColor.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: mainSizer(context: context, size: 27)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.whiteColor,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            fillColor:
                readOnly == true ? AppColor.textPrimary : AppColor.whiteColor,
            filled: true,
            hintText: hintText,
            errorMaxLines: 5,
            counterText: "",
            hintStyle: TextStyle(
                color: AppColor.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: mainSizer(context: context, size: 27)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor2,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor2,
              ),
            ),
            prefixText: prefixText ?? '',
            prefixStyle: const TextStyle(
              color: AppColor.textPrimary,
            ),
            suffixText: suffixText ?? '',
            suffixStyle: TextStyle(
              fontSize: sizer(true, 12, context),
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