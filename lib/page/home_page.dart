import "package:flutter/material.dart";
import 'dart:async';
import 'package:applestory/controller/character_widget.dart';
import 'package:applestory/controller/bluesnail.dart';
import 'package:applestory/components/button_row.dart';
import 'package:applestory/models/character_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool
  bool isMoveLeft = false;
  //blue snail
  int snailSpriteCount = 1; //1~4 蝸牛的精靈圖序號
  String snailDirection = 'left'; //蝸牛面對方向
  double snailPosX = 0.5;

  //character
  int characterSpriteCount = 1;
  double characterPox = -0.5;
  String characterDirection = 'right';

  void startGame() {
    moveSnail();
  }

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
                        child: blueSnail(
                          snailDirection: snailDirection,
                          snailSpriteCount: snailSpriteCount,
                        ),
                      ),
                      Container(
                          alignment: Alignment(characterPox, 1),
                          child: FittedBox(
                            child: CharacterWidget(
                              character: Character(
                                  characterSpriteCount: characterSpriteCount,
                                  characterDirection: characterDirection,
                                  characterPosX: 0.5),

                              /*characterSpriteCount: characterSpriteCount,
                              characterDirection: characterDirection,
                              character: null,*/
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
                child: ButtonRow(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
