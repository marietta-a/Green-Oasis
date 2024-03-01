import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';


final helpers = Helpers();
class Garden extends SpriteComponent{
   Garden(): super(size: Vector2.all(10));

   @override
   Future<void> onLoad() async{
      await add(Soil());
   }
}

class Soil extends SpriteComponent with DragCallbacks{
   Soil(): super(size: helpers.gardenSize, position: helpers.gardenPosition);

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load("soil.png");
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