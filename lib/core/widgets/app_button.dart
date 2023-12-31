import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  BuildButton({super.key, 
    required this.onPressed,
    required this.buttonText,
    required this.containerHeight,
    required this.containerWidth,
    required this.borderRadiusSize,
    required this.buttonTextSize,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.borderColor,
    required this.buttonTextWeight,
    required this.buttonTextFamily,
  });

  void Function()? onPressed;
  String buttonText;
  double containerHeight;
  double containerWidth;
  double borderRadiusSize;
  double buttonTextSize;
  Color buttonTextColor;
  Color buttonColor;
  Color borderColor;
  FontWeight buttonTextWeight;
  String buttonTextFamily;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: containerWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                side: BorderSide(color: borderColor))),
        child: Text(
          buttonText,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: buttonTextSize,
              fontWeight: buttonTextWeight,
              fontFamily: buttonTextFamily),
        ),
      ),
    );
  }
}
