import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';

class Plants extends SpriteComponent{
   Plants(): super(size: Vector2.all(8));

   @override
   Future<void> onLoad() async {
       await add(Plant());
       await add(Plant1());
       await add(Plant2());
   }
}

class Plant extends SpriteComponent with DragCallbacks{
   Plant(): super(size: plantSize, position: plantPosition);

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load("plant.png");
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

class Plant1 extends SpriteComponent with DragCallbacks{
   Plant1(): super(size: plantSize, position: plantPosition);

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load("plant1.png");
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

class Plant2 extends SpriteComponent with DragCallbacks{
   Plant2(): super(size: plantSize, position: plantPosition);

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load("plant2.png");
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