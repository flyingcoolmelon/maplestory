import "package:flutter/material.dart";
import 'dart:async';
import 'package:applestory/controller/character.dart';
import 'package:applestory/controller/bluesnail.dart';
import 'package:applestory/components/button.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool
  bool isMoveLeft = false;
  //blue snail
  int snailSpriteCount = 1;
  double snailPosX = 0.5;
  String snailDirection = 'left';
  //character
  int characterSpriteCount = 1;
  double characterPox = -0.5;
  String characterDirection = 'right';

  void startGame() {
    moveSnail();
  }

  void moveLeft() {
    setState(() {
      characterPox -= 0.03;
      characterSpriteCount = 2;
      characterDirection = 'left';
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        characterPox -= 0.01;
        characterSpriteCount = 1;
      });
    });
  }

  void moveRight() {
    setState(() {
      characterPox += 0.01;
      characterSpriteCount = 2;
      characterDirection = 'right';
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        characterPox += 0.01;
        characterSpriteCount = 1;
      });
    });
  }

  void jump() {}

  void moveSnail() {
    //蝸牛移動
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      //每150milliseconds會執行以下動作
      setState(() {
        snailSpriteCount++;
        if (snailDirection == 'left') {
          snailPosX -= 0.02;
        } else {
          snailPosX += 0.02;
        }

        if (snailPosX < 0.3) {
          snailDirection = 'right';
        } else if (snailPosX > 0.6) {
          snailDirection = 'left';
        }

        if (snailSpriteCount == 5) {
          snailSpriteCount = 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                //天空    //增加互動按鈕=>背包(彈跳視窗)
                flex: 3,
                child: Container(
                  color: Colors.blue[300],
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment(snailPosX, 1),
                        child: bluesnail(
                          snaildirection: snailDirection,
                          snailspritecount: snailSpriteCount,
                        ),
                      ),
                      Container(
                          alignment: Alignment(characterPox, 1),
                          child: FittedBox(
                            child: Character(
                              characterSpriteCount: characterSpriteCount,
                              characterDirection: characterDirection,
                            ),
                          ))
                    ],
                  ),
                )),
            Container(
              height: 10,
              color: Colors.green[600],
            ),
            Expanded(
              //地板
              child: Container(
                color: Colors.brown[600],
                //     child: Column(
                child:
                    // Text('apple stort'),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      text: '←',
                      onTapUp: (isMove) {
                        setState(() {
                          isMoveLeft = isMove;
                        });
                        while (isMoveLeft) {
                          moveLeft();
                        }
                      },
                      onTapDown: (isMove) {
                        setState(() {
                          isMoveLeft = isMove;
                        });
                      },
                    ),
                    // MyButton(
                    //   text: '→',
                    //   function: () {
                    //     moveright();
                    //   },
                    // ),
                    // MyButton(
                    //   text: '↑',
                    //   function: () {
                    //     jump();
                    //   },
                    // ),
                    // MyButton(
                    //   text: 'start',
                    //   function: () {
                    //     startGame();
                    //   },
                    // ),
                    // MyButton(
                    //   text: 'b5',
                    //   function: () {},
                    // )
                  ],
                ),

                //    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
