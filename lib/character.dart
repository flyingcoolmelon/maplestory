import 'dart:math';
import 'package:flutter/material.dart';

class charater extends StatelessWidget {
  final int characterspritecount;
  final String characterdirection;

  charater(
      {required this.characterspritecount, required this.characterdirection});

  @override
  Widget build(BuildContext context) {
    if (characterdirection == 'left') {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi), //旋轉180度
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 75,
          width: 25,
          child: Image.asset('img/character$characterspritecount.png'),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.red,
        height: 75,
        width: 25,
        child: Image.asset('img/character$characterspritecount.png'),
      );
    }
  }
}
