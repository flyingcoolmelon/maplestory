import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final void Function(TapUpDetails?)? onTapUp;
  final void Function(TapDownDetails?)? onTapDown;
  const MyButton(
      {super.key,
      required this.text,
      required this.function,
      this.onTapUp,
      this.onTapDown});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: function,
        onTapUp: onTapUp,
        onTapDown: onTapDown,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[700],
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
