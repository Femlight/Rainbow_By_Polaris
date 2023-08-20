// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import '../../styles/text.dart';

// Project imports:

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
    this.onBackPressed,
    this.automaticallyImplyLeading = true,
    this.titleColor,
    this.backgroundColor,
    this.iconColor,
    this.bottom,
    this.titleSize,
    this.titleWeight,
    this.elevation,
    this.centerTitle,
  }) : super(key: key);

  final String title;
  final double? titleSize;
  final FontWeight? titleWeight;
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? onBackPressed;
  final bool automaticallyImplyLeading;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final bool? centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 50 : 100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 1,
      leading: automaticallyImplyLeading
          ? leading != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: leading,
                )
              : IconButton(
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back,
                      color: iconColor ?? AppColor.blackColor),
                )
          : null,
      title: Text(
        title,
        style: AppText.bold500(context).copyWith(
          color: titleColor ?? AppColor.textPrimary,
          fontSize: titleSize ?? 16.sp,
          fontWeight: titleWeight,
        ),
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
      bottom: bottom,
    );
  }
}

class ChildrenCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChildrenCustomAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
    this.onBackPressed,
    this.automaticallyImplyLeading = true,
    this.titleColor,
    this.backgroundColor,
    this.iconColor,
    this.bottom,
    this.titleSize,
    this.titleWeight,
    this.elevation,
    this.centerTitle,
  }) : super(key: key);

  final String title;
  final double? titleSize;
  final FontWeight? titleWeight;
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? onBackPressed;
  final bool automaticallyImplyLeading;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final bool? centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 50 : 100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 1,
      leading: automaticallyImplyLeading
          ? leading != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: leading,
                )
              : IconButton(
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back,
                      color: iconColor ?? AppColor.blackColor),
                )
          : null,
      title: Text(
        title,
        style: AppText.bold500(context).copyWith(
            color: titleColor ?? AppColor.textPrimary,
            fontSize: titleSize ?? 20.sp,
            fontWeight: FontWeight.w400),
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
      bottom: bottom,
    );
  }
}
