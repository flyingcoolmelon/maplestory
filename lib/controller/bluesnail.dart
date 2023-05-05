import 'dart:math';
import 'package:flutter/material.dart';

class blueSnail extends StatelessWidget {
  final int snailSpriteCount; //1~4 蝸牛的精靈圖序號
  final String snailDirection; //蝸牛面對方向

  blueSnail({required this.snailSpriteCount, required this.snailDirection});
  @override
  Widget build(BuildContext context) {
    if (snailDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('img/bluesnail$snailSpriteCount.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('img/bluesnail$snailSpriteCount.png'),
        ),
      );
    }
  }
}
