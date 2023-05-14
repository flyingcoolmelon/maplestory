import 'package:flutter/material.dart';
import 'package:applestory/components/my_button.dart';
import 'dart:async';
import 'package:applestory/components/character_widget.dart';
import 'package:applestory/components/blue_snail_widget.dart';
import 'package:applestory/models/character.dart';
import 'package:applestory/constants.dart';
import 'package:applestory/models/movement.dart';

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
            height: 10,
            color: Colors.green[600],
          ),
          Expanded(
            child: Container(
              color: Colors.brown[600],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        text: '←',
                        function: () {

                        },
                      ),
                      MyButton(
                        text: '→',
                        function: () {},
                      ),
                      MyButton(
                        text: '↑',
                        function: () {},
                      ),
                      MyButton(
                        text: 'start',
                        function: () {
                        },
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
