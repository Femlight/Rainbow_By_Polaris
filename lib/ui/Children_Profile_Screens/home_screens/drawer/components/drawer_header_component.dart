// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/styles/app_text.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.clear)),
            )
          ],
        ),
        Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.asset('assets/images/debbie.png',
                    width: 60.w, height: 60.h, fit: BoxFit.fill),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: appText(
                inputText: 'Edit Profile',
                fontSize: 12,
                weight: FontWeight.w400,
                colorName: AppColor.primaryColor2,
              ),
            ),
            SizedBox(
              height: 85.h,
            )
          ],
        ),
      ],
    );
  }
}
