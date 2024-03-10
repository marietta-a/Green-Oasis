import 'dart:async';
import 'dart:js_util';

import 'package:bonfire/bonfire.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/pages/drag/drag_gesture_page.dart';


class Butterfly extends StatelessWidget{


 @override
  Widget build(BuildContext context) {
    add(ButterflySprite(), ButterflySprite());
   return Text("Butterfly");
  }
}

class ButterflySprite extends SpriteComponent{
   @override
   Future<FutureOr<void>> onLoad() async {
    sprite = await Sprite.load("conservation/butterfly1.png");
  }
}