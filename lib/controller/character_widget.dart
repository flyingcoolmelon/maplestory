import 'dart:math';
import 'package:flutter/material.dart';
import 'package:applestory/models/character_model.dart';

class CharacterWidget extends StatelessWidget {
  Character character;

  CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    if (character.characterDirection == 'left') {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi), //旋轉180度
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 75,
          width: 25,
          child:
              Image.asset('img/character${character.characterSpriteCount}.png'),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.bottomCenter,
        color: Colors.red,
        height: 75,
        width: 25,
        child:
            Image.asset('img/character${character.characterSpriteCount}.png'),
      );
    }
  }
}
