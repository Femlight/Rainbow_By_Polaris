// Flutter imports:
import 'package:flutter/material.dart';

sizer(bool width, double value, BuildContext context) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 390);
  } else {
    return MediaQuery.of(context).size.height * (value / 844);
  }
}

mainSizer({required BuildContext context, required int size}) {
  if (isPortrait(context: context)) {
    return MediaQuery.of(context).size.width / (size);
  } else {
    return MediaQuery.of(context).size.height / (size);
  }
}

bool isPortrait({required BuildContext context}) {
  return MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
      ? true
      : false;
}
