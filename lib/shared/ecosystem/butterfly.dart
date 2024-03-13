import 'dart:async';
import 'dart:js_util';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';


class Butterfly extends StatelessWidget{
  const Butterfly({super.key});



 @override
  Widget build(BuildContext context) {
    add(ButterflySprite(), ButterflySprite());
   return const Text("Butterfly");
  }
}

class ButterflySprite extends SpriteComponent{
   @override
   Future<FutureOr<void>> onLoad() async {
    sprite = await Sprite.load("conservation/butterfly1.png");
  }
}