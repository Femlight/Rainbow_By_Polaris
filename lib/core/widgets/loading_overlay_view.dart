import 'package:flutter/material.dart';
import 'package:rainbow_by_polaris/core/constants/colors.dart';
import 'package:rainbow_by_polaris/core/styles/text.dart';


class LoadingOverlayView extends StatelessWidget {
  const LoadingOverlayView({
    super.key,
    required this.showOverLay,
    required this.message,
    required this.child,
  });

  final bool showOverLay;
  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          child,
          if (showOverLay)
            Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: const CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppText.bold500(context).copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Please Wait!',
                      textAlign: TextAlign.center,
                      style: AppText.bold500(context).copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
