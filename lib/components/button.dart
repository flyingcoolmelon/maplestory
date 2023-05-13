import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final String? imageLocation;
  bool isWorking = false;
  final Function onPressed;
  final Function onTapUp;
  bool? isPicture = false;

  MyButton(
      {super.key,
      required this.text,
      this.imageLocation,
      required this.onPressed,
      required this.onTapUp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPressed(),
        // onTapUp: onTapUp(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[700],
            child: Center(
              child: isPicture!
                  ? Image.asset('imageLocation')
                  : Text(
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
