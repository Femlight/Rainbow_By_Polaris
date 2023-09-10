import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/styles/text.dart';
import '../../../core/util.dart';
import '../../../core/validators.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../core/widgets/custom_dropdown_button.dart';
import '../../../core/widgets/custom_text_input.dart';
import '../../../core/widgets/loading_overlay_view.dart';
import '../../../core/widgets/select_date_widget.dart';
import '../../../data/data_storage/user_storage.dart';
import '../../../data/dtos/create_task_dto/create_task_dto.dart';
import '../../../data/user_details/user_details_model.dart';
import '../../../service/datasource.dart';
import '../../../service/services/get_user_details.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({
    super.key,
    required this.firstName,
    required this.id,
  });
  final String firstName;
  final String id;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final validator = Validators();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? valueChoose;
  String? dropDownValue;
  String parentId = UserStorage.retrieveParentId();
  String childId = UserStorage.retrieveChildId();
  bool isLoading = false;
  String dateString = "2023-08-29";
  List items = ['childId'];
  List reward = [
    'Cash',
  ];

  void submit() async {
    if (_formKey.currentState!.validate()) {
      if (dateController.text.isEmpty) {
        Messenger.error(context, 'Set due date');
        return;
      }
      if (dropDownValue == null) {
        Messenger.error(context, 'Choose who you\'re assigning to');
        return;
      }
      if (valueChoose == null) {
        Messenger.error(context, 'Choose reward type');
        return;
      }
      final request = CreateTaskRequestDto(
          name: nameController.text,
          description: descriptionController.text,
          isTaskReccuring: true,
          dueDate: dateController.text,
          rewardType: valueChoose,
          frequency: "OneOff",
          parentAccountId: parentId,
          amount: int.parse(amountController.text),
          point: 1,
          assignTo: [childId]);
      final authSource = AuthDataSource();
      setState(() => isLoading = true);
      print('I day here ------am here');
      final response = await authSource.createTask(request);
      print('am here');
      setState(() => isLoading = false);
      response!.fold((l) => Messenger.error(context, l), (r) {
        Messenger.success(context, r.message.toString());
      });
    }
  }

  late Future<UserDetailsResponseModelDtoTexting?> userDetails;
  late Future<List<ChildDetailsViewModel>?> userChildDetails;
  Future<UserDetailsResponseModelDtoTexting?> getUserDetails() async {
    var userDetailsResponseModelDto = await UserDetailService.getUserDetails();
    return userDetailsResponseModelDto;
  }

  Future<List<ChildDetailsViewModel>?> getUserChildDetails() async {
    var userDetailsResponseModelDto =
        await UserChildDetailService.getUserChildDetails();
    return userDetailsResponseModelDto;
  }

  String firstName = UserStorage.retrieveChildFirstName();

  @override
  void initState() {
    userDetails = getUserDetails();
    userChildDetails = getUserChildDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlayView(
      message: 'Creating Task...',
      showOverLay: isLoading,
      child: Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: CustomAppBar(
          title: 'Tasks',
          backgroundColor: AppColor.primaryColor,
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
              CustomTextInput2(
                hintText: "Name",
                keyboardType: TextInputType.text,
                validator: (val) => validator.validateName(val!),
                controller: nameController,
                // preIconData: Icons.person,
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                controller: descriptionController,
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
                      borderSide: BorderSide(color: AppColor.primaryColor2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primaryColor2)),
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
                validator: (val) => validator.validateFields(val!),
              ),
              const SizedBox(
                height: 18,
              ),

              FutureBuilder<List<ChildDetailsViewModel>?>(
                  future: userChildDetails,
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: appText(
                            inputText: 'Create a profile for your Child',
                            fontSize: 12.sp,
                            weight: FontWeight.w500,
                            colorName: AppColor.textPrimary),
                      );
                    } else {
                      return CustomDropDownButton(
                        selectedValue: dropDownValue,
                        items: data?.map((child) {
                          return DropdownMenuItem(
                            value: child.firstName,
                            child: Text(child.firstName.toString()),
                          );
                        }).toList(),
                        hintText: 'Assign To',
                        onChanged: (value) {
                          setState(() {
                            dropDownValue = value.toString();
                          });
                        },
                      );
                    }
                  }),

              const SizedBox(
                height: 18,
              ),
              CustomDropDownButton<String>(
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue!;
                  });
                },
                selectedValue: valueChoose,
                items: reward.map((item) {
                  // final args = data;
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                hintText: 'Reward Type',
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextInput2(
                hintText: "Amount",
                keyboardType: TextInputType.number,
                validator: (val) => validator.validateFields(val!),
                controller: amountController,
              ),
              const SizedBox(
                height: 18,
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 10.w, top: 15.h),
              //   width: double.infinity,
              //   height: 45,
              //   decoration: const ShapeDecoration(
              //     color: Color(0xFFD9D9D9),
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(width: 1, color: AppColor.primaryColor2),
              //     ),
              //   ),
              //   child: appText(
              //       inputText: 'Total Amount',
              //       fontSize: 12.sp,
              //       weight: FontWeight.w400,
              //       colorName: AppColor.textPrimary),
              // ),
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
                onPressed: submit,
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
      ),
    );
  }
}
