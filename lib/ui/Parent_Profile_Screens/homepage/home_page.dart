import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/styles/app_text.dart';
import '../../../core/helpers/navigator.dart';
import '../../../core/styles/spacing.dart';
import '../../../data/data_storage/user_storage.dart';
import '../../../data/user_details/user_details_model.dart';
import '../../../service/services/get_user_details.dart';
import '../add_child_page/add_child_Screen.dart';
import '../childs_profile/child_profile.dart';
import '../settings/notification.dart';
import '../task/create_task.dart';
import '../wallet/transfer_page.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.userProfileDto,
  });
  final UserDto? userProfileDto;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProfileDetails> details = [
    ProfileDetails(image: 'assets/images/advert.png', name: 'Peter'),
    ProfileDetails(image: 'assets/images/debbie.png', name: 'Debbie'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Stacey'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Joseph'),
    ProfileDetails(image: 'assets/images/advert.png', name: 'Mary'),
  ];

  late Future<UserDetailsResponseModelDtoTexting?> userDetails;
  late Future<List<ChildDetailsViewModel>?> userChildDetails;
  Future<UserDetailsResponseModelDtoTexting?> getUserDetails() async {
    var userDetailsResponseModelDto = await UserDetailService.getUserDetails();
    UserStorage.storePhoneNumber(
        userDetailsResponseModelDto!.value!.phoneNumber.toString());
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
    String firstName = UserStorage.retrieveFirstName();
    String lastName = UserStorage.retrieveLastName();
    String accountId = UserStorage.retrieveChildId();
    String phoneNumber = UserStorage.retrievePhoneNumber();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<UserDetailsResponseModelDtoTexting?>(
                future: userDetails,
                builder: (context, snapshot) {
                  var user = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return appText(
                        inputText: 'Please Reload',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.textPrimary);
                  } else {
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          radius: 30,
                          child: appText(
                              inputText: firstName[0] + lastName[0],
                              fontSize: 20.sp,
                              weight: FontWeight.w500,
                              colorName: AppColor.whiteColor),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                                inputText: 'Welcome back,',
                                fontSize: 12.sp,
                                weight: FontWeight.w400,
                                colorName: AppColor.textPrimary),
                            appText(
                                inputText: firstName,
                                fontSize: 12.sp,
                                weight: FontWeight.w600,
                                colorName: AppColor.textPrimary),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              AppNavigator.to(
                                  context, const NotificationScreen());
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: AppColor.blackColor,
                            ))
                      ],
                    );
                  }
                }),
            SizedBox(
              height: 38.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineContainer(
                  onTap: () {
                    AppNavigator.to(
                        context,
                        CreateTask(
                          firstName: childName,
                          id: accountId.toString(),
                        ));
                  },
                  text: 'Create task',
                  width: 133,
                  height: 45,
                  assetImage: 'assets/icons/create_task.svg',
                ),
                OutlineContainer(
                  onTap: () {
                    AppNavigator.to(context, const TransferPage());
                  },
                  text: 'Send allowance',
                  width: 160,
                  height: 45,
                  assetImage: 'assets/icons/send.svg',
                ),
              ],
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                // controller: _scrollController1,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, _) => SizedBox(
                  width: 20.w,
                ),
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return buildAdvert(details: details[index], onTap: () {});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    inputText: 'My Kids',
                    fontSize: 16.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                TextButton(
                    onPressed: () {
                      AppNavigator.to(context, const AddChildScreen1());
                    },
                    child: appText(
                        inputText: 'Add Child',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.textPrimary)),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 100.h,
              child: FutureBuilder<List<ChildDetailsViewModel>?>(
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
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, _) => SizedBox(
                          width: 20.w,
                        ),
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          final args = data[index];
                          childName = args.toString();
                          return GestureDetector(
                            onTap: () {
                              AppNavigator.to(
                                  context,
                                  ChildProfile(
                                    accountNo: args.accountNumber.toString(),
                                    firstName: args.firstName.toString(),
                                    id: args.accountId.toString(),
                                    lastName: args.lastName.toString(),
                                  ));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColor.primaryColor,
                                  radius: 30,
                                  child: appText(
                                      inputText: args.firstName![0].toString() +
                                          args.lastName![0].toString(),
                                      fontSize: 20.sp,
                                      weight: FontWeight.w500,
                                      colorName: AppColor.whiteColor),
                                ),
                                appText(
                                    inputText: args.firstName.toString(),
                                    fontSize: 14.sp,
                                    weight: FontWeight.w500,
                                    colorName: AppColor.textPrimary),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    inputText: 'Activity',
                    fontSize: 17.sp,
                    weight: FontWeight.w700,
                    colorName: AppColor.textPrimary),
                TextButton(
                    onPressed: () {},
                    child: appText(
                        inputText: 'See All',
                        fontSize: 12.sp,
                        weight: FontWeight.w500,
                        colorName: AppColor.textPrimary)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 65.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Color(0xFF75229C)),
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/complete_task.svg'),
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Create Task for ',
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Peter',
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ]),
                    ),
                  ),
                  appText(
                      inputText: 'Dec. 8, 2013',
                      fontSize: 12.sp,
                      weight: FontWeight.w400,
                      colorName: AppColor.textPrimary)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
//
// Widget buildProfile(
//     {required ProfileDetails details, required VoidCallback onTap}) {
//   return FutureBuilder<UserDetailsResponseModelDto?>(
//       future: userDetails,
//       builder: (context, snapshot) {
//         var data = snapshot.data;
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return
//             LinearProgressIndicator(
//               color: AppColor.blackColor,
//             );
//         } else {
//           return  GestureDetector(
//             onTap: onTap,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   child: Image.asset(details.image),
//                 ),
//                 appText(
//                     inputText: details.name,
//                     fontSize: 14.sp,
//                     weight: FontWeight.w500,
//                     colorName: AppColor.textPrimary)
//               ],
//             ),
//           );
//         }
//       });
// }

Widget buildAdvert(
    {required ProfileDetails details, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Center(child: Image.asset('assets/images/advert.png')),
      ],
    ),
  );
}

class ProfileDetails {
  final String image;
  final String name;
  ProfileDetails({required this.image, required this.name});
}
