import 'package:flutter/material.dart';
import 'package:applestory/components/my_button.dart';
import 'dart:async';
import 'package:applestory/components/character_widget.dart';
import 'package:applestory/components/blue_snail_widget.dart';
import 'package:applestory/models/character.dart';
import 'package:applestory/constants.dart';
import 'package:applestory/models/movement.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isStart = false;
  Character blueSnail =
      Character(direction: Directions.left, spriteCount: 1, position: 0.5);
  Character character =
      Character(spriteCount: 1, direction: Directions.right, position: -0.5);

  // void startGame() {
  //   movesnail();
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              //天空
              color: Colors.blue[300],
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment(blueSnail.position, 1),
                    child: BlueSnailWidget(blueSnail: blueSnail),
                  ),
                  Container(
                    alignment: Alignment(character.position, 1),
                    child: CharacterWidget(
                      character: character,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //草地
            height: 10,
            color: Colors.green[600],
          ),
          Expanded(
            child: Container(
              //地板
              color: Colors.brown[600],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        text: '←',
                        function: () {
                          print('a');
                          print(character.position);
                        },
                        onTapDown: (context) {
                          Movements.moveLeft(character: character);
                          print("tapdown");
                        },
                      ),
                      MyButton(
                        text: '→',
                        function: () {
                          print("tap");
                        },
                        onTapUp: (context) {
                          print("tapup");
                          Movements.stopMoving();
                        },
                        onTapDown: (context) {
                          Movements.moveRight(character: character);
                          print("tapdown");
                        },
                      ),
                      MyButton(
                        text: '↑',
                        function: () {
                          Movements.snailMove(blueSnail: blueSnail);
                        },
                      ),
                      MyButton(
                        text: 'start',
                        function: () {},
                      ),
                      MyButton(
                        text: 'b5',
                        function: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
