import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  // final Function function;
  bool isMove = false;
  final Function onTapDown;
  final Function onTapUp;

  MyButton(
      {super.key,
      required this.text,
      //   required this.function,
      required this.onTapDown,
      required this.onTapUp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTapDown: onTapDown(isMove = true),
        onTapUp: onTapUp(isMove = false),
        //onTapUp: function,
        //      onLongPressCancel: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[700],
            child: Center(
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        //child: const Text('aaa'),
      ),
    );
  }
}
