// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:

class Loading extends StatelessWidget {
  const Loading({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: defaultTargetPlatform == TargetPlatform.android
            ? CircularProgressIndicator(
                backgroundColor: color,
              )
            : CupertinoActivityIndicator(
                color: color,
              ),
      ),
    );
  }
}
