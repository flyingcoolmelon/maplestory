import 'dart:math';
import 'package:flutter/material.dart';
import 'package:applestory/constants.dart';
import 'package:applestory/models/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    if (character.direction == Directions.left) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi), //旋轉180度
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 75,
          width: 25,
          child: Image.asset('img/character${character.spriteCount}.png'),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 75,
        width: 25,
        child: Image.asset('img/character${character.spriteCount}.png'),
      );
    }
  }
}
