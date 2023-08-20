import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../core/widgets/custom_dropdown_button.dart';
import '../../../core/widgets/custom_text_input.dart';
import '../../../core/widgets/select_date_widget.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController flightClassController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? valueChoose;

  // List of items in our dropdown menu
  List items = [
    '10203040501',
    '10203040502',
    '10203040503',
    '10203040504',
    '10203040505',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: CustomAppBar(
        title: 'Tasks',
        backgroundColor: AppColor.primaryColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {
              // AppNavigator.to(context, const CartProduct());
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
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 43.h,
            ),
            appText(
                inputText: 'Create Task',
                fontSize: 14.sp,
                weight: FontWeight.w600,
                colorName: AppColor.textPrimary),
            SizedBox(
              height: 19.h,
            ),
            const CustomTextInput2(
              hintText: "Name",
              keyboardType: TextInputType.text,
              // controller: userNameController,
              // preIconData: Icons.person,
            ),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              controller: _descriptionController,
              style: AppText.bold500(context).copyWith(
                fontSize: 16,
              ),
              cursorColor: AppColor.blackColor,
              maxLines: 6,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: AppColor.textPrimary,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor2)
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor2)
                ),
                focusColor: AppColor.primaryColor2,
                filled: true,
                fillColor: AppColor.whiteColor,
                hintText: 'Task Description',
                errorMaxLines: 5,
                hintStyle: TextStyle(
                    color: AppColor.textPrimary,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp),
              ),
              // validator: validator,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomDropDownButton(
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue.toString();
                });
              },
              selectedValue: valueChoose,
              items: items.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              hintText: 'Assign To',
            ),
            const SizedBox(
              height: 18,
            ),
            CustomDropDownButton(
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue.toString();
                });
              },
              selectedValue: valueChoose,
              items: items.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              hintText: 'Reward Type',
            ),
            const SizedBox(
              height: 18,
            ),
            const CustomTextInput2(
              hintText: "Amount",
              keyboardType: TextInputType.number,
              // controller: userNameController,
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w, top: 15.h),
              width: double.infinity,
              height: 45,
              decoration: const ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColor.primaryColor2),
                ),
              ),
              child: appText(
                  inputText: 'Total Amount',
                  fontSize: 12.sp,
                  weight: FontWeight.w400,
                  colorName: AppColor.textPrimary),
            ),
            SelectDateField(
                title: '',
                hintText: 'Due Date',
                controller: dateController,
                onTap: () async {
                  final date = await DateTimeUtils.pickDate(
                    context,
                    firstDate: DateTime.now(),
                  );
                  if (date == null) return;

                  dateController.text = DateTimeUtils.getDateStr(date);
                  // controller.setDepartureDate(date);
                }),
            SizedBox(
              height: 86.h,
            ),
            BuildButton(
              onPressed: () {
                // AppNavigator.pushReplacement(context, const AccountCreated());
              },
              buttonText: 'Add Task',
              containerHeight: 44.h,
              containerWidth: 189.w,
              borderRadiusSize: 0,
              buttonTextSize: 16.sp,
              buttonTextColor: Colors.white,
              buttonColor: AppColor.primaryColor2,
              borderColor: AppColor.primaryColor2,
              buttonTextWeight: FontWeight.w700,
              buttonTextFamily: 'Montserrat-Regular',
            ),
          ]),
        ),
      ),
    );
  }
}
