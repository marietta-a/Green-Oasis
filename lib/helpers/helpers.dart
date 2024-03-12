
import 'dart:math';
import 'dart:ui';
import 'package:bonfire/decoration/decoration.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:green_oasis/components/core.dart';


class Helpers{
  const Helpers();
  static String PlayerName = "Player";
  Vector2 get screenSize => Vector2(1920, 1080); 

  // house helpers
  Vector2 get housePosition => Vector2(screenSize.x/4, 0); 
  Vector2 get houseSize => Vector2.all(400);


  Vector2 get itemSize => Vector2.all(100);

  //plants helpers
  Vector2 get plantSize => Vector2.all(200);
  Vector2 get plantPosition => Vector2(screenSize.x/2, 80);

  // garden helpers

  Vector2 get gardenSize => Vector2(600, 200);
  Vector2 get gardenPosition => Vector2(screenSize.x/2, 80);


  //Syles
  Color get cardColor =>  const Color(0xffeeee00);


  Future<dynamic> openCustomDialog(BuildContext context,  String title, String content, Color color) async{
     return  showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0), 
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(title),
                content: Text(content, selectionColor: Colors.white,),
                backgroundColor: color,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.cyan
                ),
                contentTextStyle: TextStyle(
                  color: Colors.white,
                  backgroundColor: color
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
            return ClassicGeneralDialogWidget(
              titleText: 'Title',
              contentText: 'content',
              onPositiveClick: () {
                Navigator.of(context).pop();
              },
              onNegativeClick: () {
                Navigator.of(context).pop();
              },
            );
        }
      );
  }
}

class GamePoints{
  GamePoints();
  bool hasNegative = false;
  bool hasPositive = false;
  bool get shouldCompute => !hasNegative ||  !hasPositive;
  int id = -1;
  void resetItem(){
    hasNegative = false;
    hasPositive = false;
  }
}


class MySineTween extends Animatable<double> {
  final double maxExtent;

  const MySineTween(this.maxExtent);

  @override
  double transform(double t) {
    return sin(t * 2 * pi) * maxExtent;
  }
}
