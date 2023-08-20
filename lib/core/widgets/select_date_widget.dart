import 'package:flutter/material.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import '../styles/text.dart';

class SelectDateField extends StatelessWidget {
  const SelectDateField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.onTap,
    this.disabled = false,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final Function() onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(1),
      borderSide: const BorderSide(
        color:AppColor.primaryColor,
      ),
    );

    final field = TextFormField(
      controller: controller,
      readOnly: true,
      onTap: disabled ? null : onTap,
      style: AppText.bold400(context).copyWith(
        fontSize: 13,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: AppText.bold400(context).copyWith(
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        border: border,
        enabledBorder: border,
        suffixIcon: const Icon(Icons.calendar_month),
           focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColor.primaryColor2,
              ),
            ),
      ),
      
    );

    final titlestyle = AppText.bold600(context).copyWith(
      fontSize: 14,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titlestyle,
        ),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
