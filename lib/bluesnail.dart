import 'dart:math';
import 'package:flutter/material.dart';

class bluesnail extends StatelessWidget {
  final int snailspritecount; //1~4 蝸牛的精靈圖序號
  final String snaildirection; //蝸牛面對方向

  bluesnail({required this.snailspritecount, required this.snaildirection});
  @override
  Widget build(BuildContext context) {
    if (snaildirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('img/bluesnail$snailspritecount.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('img/bluesnail$snailspritecount.png'),
        ),
      );
    }
  }
}
