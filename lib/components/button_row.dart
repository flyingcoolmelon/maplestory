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
          onPressed: () {
            print('abb');
            // setState(() {
            //   isMoveLeft = isMove;
            // });
            // while (isMoveLeft) {
            //   moveLeft();
            // }
          },
        ),
        // MyButton(
        //   text: '→',
        //   onTap: (context) {},
        //   onTapUp: (context) {},
        // ),
        // MyButton(
        //   text: '↑',
        //   onTap: (context) {},
        //   onTapUp: (context) {},
        // ),
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
