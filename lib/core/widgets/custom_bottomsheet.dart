import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles/spacing.dart';


Future<dynamic> showCustomBottomSheet({
  required BuildContext context,
  required Widget body,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  final size = MediaQuery.of(context).size.height;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: enableDrag,
    constraints: BoxConstraints(
      maxHeight: size,
    ),
    isDismissible: isDismissible,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: body,
    ),
  );
}

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody({
    Key? key,
    required this.content,
    this.padding,
    this.margin,
    this.height,
    this.isScrollable = true,
  }) : super(key: key);

  final List<Widget> content;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        margin: margin,
        padding: padding ??
            EdgeInsets.only(
              top: 20.73,
              right: AppPadding.horizontal,
              left: AppPadding.horizontal,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          padding: MediaQuery.of(context).viewInsets,
          physics: isScrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: content,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetCloseButton extends StatelessWidget {
  const BottomSheetCloseButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 10.46,
            right: 5,
          ),
          child: Icon(
            Icons.cancel,
            size: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}

class BottomSheetDragger extends StatelessWidget {
  const BottomSheetDragger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
