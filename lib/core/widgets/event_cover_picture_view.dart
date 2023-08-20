import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_by_polaris/core/helpers/functions.dart';
import '../styles/spacing.dart';
import '../styles/text.dart';
import 'loading.dart';
import 'pick_image_bottomsheet.dart';

class EventCoverPictureView extends StatelessWidget {
  const EventCoverPictureView({super.key, this.image, required this.isLoading, required this.openCamera, required this.openGallery});

  final File? image;
  final bool isLoading;
  final Function() openCamera;
  final Function() openGallery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppPadding.horizontal),
          child: const TitleWidget('COVER PICTURE'),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: AppPadding.horizontal,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffD9D9D9).withOpacity(.1),
            border: Border.all(
              color: const Color(0xff595751).withOpacity(.15),
              width: 2,
            ),
          ),
          child: InkWell(
            onTap: () {
              pickImageBottomSheet(
                context: context,
                openCamera: openCamera,
                openGallery: openGallery,
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 59),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 0.1),
                border: Border.all(
                  color: const Color.fromRGBO(89, 87, 81, 0.16),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: isLoading
                  ? const Column(
                      children: [
                        Loading(),
                        SizedBox(height: 5),
                        Text('Uploading....'),
                      ],
                    )
                  : image != null
                      ? Image.file(
                          image!,
                          fit: BoxFit.fill,
                        )
                      : Container(
                          width: 66,
                          height: 63,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(218, 218, 218, 0.84),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.camera_fill,
                            color: Colors.grey,
                            size: 45,
                          ),
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
class TitleWidget extends StatelessWidget {
  const TitleWidget(
    this.title, {
    super.key,
    this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toTitleCase,
      style: AppText.bold400(context).copyWith(
        color: color,
      ),
    );
  }
}