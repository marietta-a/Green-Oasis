import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/shared/util/conservation_sprite.dart';

final spriteSize = Vector2.all(25);
const helpers = Helpers();
GamePoints item = GamePoints();
double totalpoints = 0;
double globalPoints = 0;
bool pointsGained = false;



class FlowerArtificial2Drag extends GameDecoration
    with DragGesture, Movement  {
  late TextPaint _textPaint;
  final String text = 'Artificial';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  final DesignModel designNotifier;
  FlowerArtificial2Drag({required this.childPosition, 
  required this.parentPosition, 
  required this.parentSize,
  required this.designNotifier,
  }): super.withSprite(
    sprite: ConservationSpriteSheet.flowerart2Sprite,
    size: spriteSize,
    renderAboveComponents: true,
    position: childPosition
  );

  final Vector2 childPosition;
  @override
  Future<void> onLoad() {
     item.id = 0;
     _addsText();
     return super.onLoad();
  }   


  @override
  bool handlerPointerUp(PointerUpEvent event) {
    if(inMoving){
      onDragEnd();
    }
    return false;
  }


 onDragEnd(){
  evaluatePoint(parentPosition, 
    parentSize, 
    position, 
    spriteSize, 
    gameRef.context,
    designNotifier,
    isFake: true,
  );
}


  void _addsText() {
    _textPaint = TextPaint(
      style: TextStyle(
        fontSize: 4,
        color: Colors.white,
      ),
    );
    var textSize = _textPaint.getLineMetrics(text).size;
    add(
      TextComponent(
        text: text,
        position: Vector2((textSize.x / -2) + size.x / 2, -5),
        textRenderer: _textPaint,
      ),
    );
  }


}

  Future<void> evaluatePoint(Vector2 parentPosition,
   Vector2 parentSize, 
   Vector2 itemPosition, 
   Vector2 itemSize, 
   BuildContext context,
   DesignModel designNotifier,
   {bool isFake = false}) async {
    var parentX = parentPosition.x + parentSize.x;
    var parentY = parentPosition.y + parentSize.y;
    var childX =  itemPosition.x + itemSize.x;
    var childY =  itemPosition.y + itemSize.y;
    var isValidX = childX >= parentPosition.x && childX <= parentX;
    var isValidY = childY >= parentPosition.y && childY <= parentY;
    double points = 0;
    
    if(isValidX && isValidY){
      points = isFake ? -10 : 20;
      pointsGained = points >= 0;
    }
    else{
      points = -5;
      pointsGained  = false;
    }

    var shouldCompute = item.shouldCompute && !(globalPoints == points);

    if(pointsGained && !item.hasPositive){
      item.hasPositive = true;
    }
    if(!pointsGained && !item.hasNegative){
      item.hasNegative = true;
    }
    globalPoints = points;
    
    if(shouldCompute){
      totalpoints += points;

      if(pointsGained){
       await helpers.openCustomDialog(
          context, 
          "Bravo!!!", 
          "You Gained ${points}", 
          Colors.green
        );
      }
      else{
        await helpers.openCustomDialog(
          context, 
          "Oopss!!!", 
          isFake? "You Lost ${points} (Use natural flowers)" : "You Lost ${points} (Place on soil)", 
          Colors.red
        );
      }
    
     designNotifier.setPoints(points);  
  }

}
  