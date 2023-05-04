import 'dart:math';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  final int characterSpriteCount;
  final String characterDirection;

  Character(
      {super.key,
      required this.characterSpriteCount,
      required this.characterDirection});

  @override
  Widget build(BuildContext context) {
    if (characterDirection == 'left') {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi), //旋轉180度
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 75,
          width: 25,
          child: Image.asset('img/character$characterSpriteCount.png'),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.red,
        height: 75,
        width: 25,
        child: Image.asset('img/character$characterSpriteCount.png'),
      );
    }
  }
}
