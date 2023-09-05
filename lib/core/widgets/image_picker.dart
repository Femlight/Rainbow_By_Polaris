import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import '../styles/app_text.dart';

// Widget profileImagePicker() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 34.h),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         appText(
//             inputText: 'Edit Profile Image',
//             fontSize: 20.sp,
//             weight: FontWeight.w500,
//             colorName: AppColor.textPrimary),
//         SizedBox(height: 15.h),
//         buildImagePickerButton(
//           onPressed: () async {
//             await getImage(ImageSource.camera);
//             // if(image != null){
//             // _uploadImage();}
//             Navigator.pop(context);
//           },
//           buttonText: 'Camera',
//           pixIcon: Iconsax.camera,
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         buildImagePickerButton(
//           buttonText: 'Gallery',
//           pixIcon: Iconsax.gallery5,
//           onPressed: () async {
//             await getImage(ImageSource.gallery);
//             // if(image != null){
//             // _uploadImage();}
//             Navigator.pop(context);
//           },
//         ),
//         SizedBox(height: 50.h),
//       ],
//     ),
//   );
// }
//
// Widget buildImagePickerButton(
//     {required VoidCallback onPressed,
//     required String buttonText,
//     required IconData pixIcon}) {
//   return SizedBox(
//     height: 60.h,
//     width: 366.w,
//     child: ElevatedButton(
//       onPressed: onPressed,
//       child: Padding(
//         padding: EdgeInsets.only(left: 20.w, right: 20.58.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Icon(pixIcon, color: AppColor.primaryColor),
//                 SizedBox(
//                   width: 18.w,
//                 ),
//                 Text(
//                   buttonText,
//                   style: TextStyle(
//                     color: AppColor.textPrimary,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//             Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: Color(0xff292D32),
//               size: 15.w,
//             ),
//           ],
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//           elevation: 0,
//           primary: AppColor.grayColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           )),
//     ),
//   );
// }
