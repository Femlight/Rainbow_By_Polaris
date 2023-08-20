import 'package:flutter/material.dart';

import '../../../../core/helpers/navigator.dart';
import '../../widgets/widgets.dart';
import '../transfer_page.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 279,
      height: 144,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WalletContainer(
                  text: 'Fund',
                  icon: Icons.add,
                  onTap: () {},
                ),
                WalletContainer(
                  text: 'Send',
                  icon: Icons.send,
                  onTap: () {
                    AppNavigator.to(context, const TransferPage());
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: -8,
            top: -16,
            child: SizedBox(
              width: 75,
              height: 75,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 69,
                      height: 69,
                      decoration: const ShapeDecoration(
                        color: Color(0x33C8A2C8),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: const ShapeDecoration(
                        color: Color(0x33C8A2C8),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 298,
            top: 159,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(-3.14),
              child: SizedBox(
                width: 75,
                height: 75,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-3.14),
                        child: Container(
                          width: 69,
                          height: 69,
                          decoration: const ShapeDecoration(
                            color: Color(0x33C8A2C8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-3.14),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: const ShapeDecoration(
                            color: Color(0x33C8A2C8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
