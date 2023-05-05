import 'package:flutter/material.dart';
import 'package:applestory/components/button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyButton(
          text: '←',
          onTapUp: (isMove) {
            // setState(() {
            //   isMoveLeft = isMove;
            // });
            // while (isMoveLeft) {
            //   moveLeft();
            // }
          },
          onTapDown: (isMove) {
            // setState(() {
            //   isMoveLeft = isMove;
            // });
          },
        ),
        MyButton(
          text: '→',
          onTapDown: (context) {},
          onTapUp: (context) {},
        ),
        MyButton(
          text: '↑',
          onTapDown: (context) {},
          onTapUp: (context) {},
        ),
        // MyButton(
        //   text: 'start',
        //   onTapDown: () {},
        //   onTapUp: () {},
        // ),
        // MyButton(
        //   text: 'b5',
        //   onTapDown: () {},
        //   onTapUp: () {},
        // )
      ],
    );
  }
}
