// ignore_for_file: must_be_immutable

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';

class Houses extends SpriteComponent{
   Houses() : super(size: Vector2.all(1600));
   List sprites = [];
   @override
   Future<void> onLoad() async {
     sprites.add(House());
     sprites.add(House1());
     sprites.add(House2());
   }
}

class House extends SpriteComponent with DragCallbacks{
   static String src = "house.png";
   House() : super(size: houseSize, position: housePosition);

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load(src);
   }
  // @override
  // bool debugMode = true;


  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }
}

class House1 extends SpriteComponent with DragCallbacks{
   static String src = "house1.webp";
   House1() : super(size: houseSize, position: housePosition);

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load(src);
   }
  // @override
  // bool debugMode = true;


  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }
}

class House2 extends SpriteComponent with DragCallbacks{
   static String src = "house2.png";
   House2() : super(size: houseSize, position: housePosition);

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load(src);
   }
  // @override
  // bool debugMode = true;


  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }
}