import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //bluesnail
  int snailspritecount = 1;
  double snailPosX = 0.5;
  String snaildirection = 'left';
  //charater
  int characterspritecount = 1;
  double characterPox = -0.5;
  String characterdirection = 'right';

  void startGame() {
    movesnail();
  }

  void moveleft() {
    setState(() {
      characterPox -= 0.03;
      characterspritecount++;
      characterdirection = 'left';
    });
  }

  void moveright() {
    setState(() {
      characterPox += 0.01;
      characterspritecount = 2;
      characterdirection = 'right';
    });
    Future.delayed(
      const Duration(milliseconds: 5000),
    );
    setState(() {
      characterPox += 0.01;
      characterspritecount = 1;
      characterdirection = 'right';
    });
  }

  void jump() {}

  void movesnail() {
    //蝸牛移動
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      //每150milliseconds會執行以下動作
      setState(() {
        snailspritecount++;
        if (snaildirection == 'left') {
          snailPosX -= 0.02;
        } else {
          snailPosX += 0.02;
        }

        if (snailPosX < 0.3) {
          snaildirection = 'right';
        } else if (snailPosX > 0.6) {
          snaildirection = 'left';
        }

        if (snailspritecount == 5) {
          snailspritecount = 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          snaildirection: snaildirection,
                          snailspritecount: snailspritecount,
                        ),
                      ),
                      Container(
                          alignment: Alignment(characterPox, 1),
                          child: charater(
                            characterspritecount: (characterspritecount % 2) + 1,
                            characterdirection: characterdirection,
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
                    child: Column(
                      children: [
                        // Text('apple stort'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Mybutton(
                              text: '←',
                              function: () {
                                moveleft();
                              },
                            ),
                            Mybutton(
                              text: '→',
                              function: () {
                                moveright();
                              },
                            ),
                            Mybutton(
                              text: '↑',
                              function: () {
                                jump();
                              },
                            ),
                            Mybutton(
                              text: 'start',
                              function: () {
                                startGame();
                              },
                            ),
                            Mybutton(
                              text: 'b5',
                              function: () {},
                            )
                          ],
                        ),
                      ],
                    ))),
          ],
        ));
  }
}
