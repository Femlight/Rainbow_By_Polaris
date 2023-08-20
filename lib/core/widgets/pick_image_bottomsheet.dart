import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_bottomsheet.dart';


Future<dynamic> pickImageBottomSheet({
  required BuildContext context,
  required Function() openCamera,
  required Function() openGallery,
}) {
  return showCustomBottomSheet(
    context: context,
    body: _Body(
      openCamera: openCamera,
      openGallery: openGallery,
    ),
  );
}

class _Body extends StatelessWidget {
  const _Body({required this.openGallery, required this.openCamera});

  final Function() openCamera;
  final Function() openGallery;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetBody(
      content: [
        const BottomSheetDragger(),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Button(
              icon: Icons.camera_alt,
              label: 'Camera',
              onTap: openCamera,
            ),
            const SizedBox(width: 40),
            _Button(
              icon: Icons.image,
              label: 'Gallery',
              onTap: openGallery,
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.grayColor, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: AppColor.primaryColor,
                size: 50,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
