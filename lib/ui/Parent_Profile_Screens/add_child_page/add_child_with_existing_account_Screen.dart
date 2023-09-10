import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/colors.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/app_text.dart';
import '../../../core/styles/spacing.dart';
import '../../../core/widgets/appbars/custom_appbar.dart';
import '../../../data/user_details/user_details_model.dart';
import '../../../service/services/get_user_details.dart';
import '../settings/notification.dart';
import 'add_child_with_existing_account/add_child_with_existing_account_screen.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
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

  @override
  void initState() {
    userDetails = getUserDetails();
    userChildDetails = getUserChildDetails();
    // TODO: implement initState
    super.initState();
  }

  String childName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: CustomAppBar(
        title: 'My Kids',
        backgroundColor: AppColor.primaryColor,
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {
              AppNavigator.to(context, const NotificationScreen());
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 34.h,
              ),
              appText(
                  inputText: 'Add Child',
                  fontSize: 16.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.textPrimary),
              SizedBox(
                height: 29.h,
              ),
              appText(
                  inputText:
                      'Here are the Rainbow accounts linked to your profile',
                  fontSize: 12.sp,
                  weight: FontWeight.w500,
                  colorName: AppColor.textPrimary),
              SizedBox(height: 69.h),
              FutureBuilder<List<ChildDetailsViewModel>?>(
                  future: userChildDetails,
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    // print(data);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      );
                    } else if (snapshot.hasError || snapshot.data!.isEmpty) {
                      return Center(
                        child: appText(
                            inputText: 'Create a profile for your Child',
                            fontSize: 12.sp,
                            weight: FontWeight.w500,
                            colorName: AppColor.textPrimary),
                      );
                    } else {
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (context, _) => SizedBox(
                          width: 20.w,
                        ),
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final args = data[index];
                          childName = args.toString();
                          return AccountDetails(
                            accountName: args.firstName.toString(),
                            accountNumber: args.accountNumber.toString(),
                            onTap: () {
                              AppNavigator.to(
                                  context,
                                  AddChildScreenWithExistingAccount(
                                    accountNo: args.accountNumber.toString(),
                                    firstName: args.firstName.toString(),
                                    id: args.accountId.toString(),
                                    lastName: args.lastName.toString(),
                                  ));
                            },
                          );
                        },
                      );
                    }
                  }),
              SizedBox(
                height: 86.h,
              ),
            ]),
      ),
    );
  }
}

class AccountDetails extends StatelessWidget {
  final String accountName;
  final String accountNumber;
  final Function()? onTap;
  const AccountDetails(
      {Key? key,
      required this.accountName,
      required this.accountNumber,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 287.w,
          height: 98.h,
          decoration: ShapeDecoration(
            color: const Color(0xC975229C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 184,
                top: -33,
                child: SizedBox(
                  width: 109,
                  height: 108,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 38,
                        top: 20,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFAC4BB5),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 51,
                        top: 20,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFC8A2C8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 59,
                        top: 20,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFE5F9),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 28,
                child: Row(
                  children: [
                    Column(
                      children: [
                        appText(
                            inputText: accountName,
                            fontSize: 12.sp,
                            weight: FontWeight.w700,
                            colorName: AppColor.whiteColor),
                        SizedBox(
                          height: 13.h,
                        ),
                        appText(
                            inputText: accountNumber,
                            fontSize: 12.sp,
                            weight: FontWeight.w600,
                            colorName: AppColor.whiteColor),
                      ],
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    appText(
                        inputText: 'CREATE',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.whiteColor),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColor.whiteColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
