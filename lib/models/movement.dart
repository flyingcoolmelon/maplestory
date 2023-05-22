import 'character.dart';
import 'package:applestory/constants.dart';
import 'dart:async';

class Movements {
  bool _isMove = false;
  static void moveLeft({required Character character}) {
    Timer.periodic(const Duration(milliseconds: 200), (moveLefttimer) {
      character.position -= 0.03;
      character.spriteCount == 1
          ? character.spriteCount++
          : character.spriteCount--;
      character.direction = Directions.left;
    });
  }

  static void moveRight({required Character character}) {
    Timer.periodic(const Duration(milliseconds: 200), (moveRighttimer) {
      character.position += 0.03;
      character.spriteCount == 1
          ? character.spriteCount++
          : character.spriteCount--;
      character.direction = Directions.right;
      if (_isMove) {
        moveRighttimer.cancel();
      }
    });
  }

  static bool stopMoving() {
    return true;
  }

  static void snailMove({required Character blueSnail}) {
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      blueSnail.spriteCount++;
      if (blueSnail.direction == Directions.left) {
        blueSnail.position -= 0.02;
      } else {
        blueSnail.position += 0.02;
      }

      if (blueSnail.position < 0.3) {
        blueSnail.direction = Directions.right;
      } else if (blueSnail.position > 0.6) {
        blueSnail.direction = Directions.left;
      }

      if (blueSnail.spriteCount == 5) {
        blueSnail.spriteCount = 1;
      }
    });
  }
}
