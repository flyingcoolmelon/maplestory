import 'dart:math';
import 'package:flutter/material.dart';
import 'package:applestory/models/blue_snail.dart';
import 'package:applestory/constants.dart';

class BlueSnailWidget extends StatelessWidget {
  final BlueSnail blueSnail;
  const BlueSnailWidget({super.key, required this.blueSnail});

  @override
  Widget build(BuildContext context) {
    if (blueSnail.direction == Directions.left) {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('img/bluesnail${blueSnail.spriteCount}.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('img/bluesnail${blueSnail.spriteCount}.png'),
        ),
      );
    }
  }
}