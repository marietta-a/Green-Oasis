import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/pages/drag/conservation_drag.dart';
import 'package:green_oasis/shared/util/conservation_sprite.dart';

final spriteSize = Vector2.all(25);
const helpers = Helpers();
GamePoints item = GamePoints();
double totalpoints = 0;
double globalPoints = 0;
bool pointsGained = false;



class Flower6Drag extends GameDecoration
    with DragGesture, Movement  {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  final DesignModel designNotifier;
  Flower6Drag({required this.childPosition, 
  required this.parentPosition, 
  required this.parentSize,
  required this.designNotifier,
  }): super.withSprite(
    sprite: ConservationSpriteSheet.flower1Sprite,
    size: spriteSize,
    renderAboveComponents: true,
    position: childPosition
  );

  final Vector2 childPosition;
  late int butterflies = 0;
  
  @override void update(double dt) {
    if(designNotifier.totalpoints > 50 && butterflies < 1){
      add(ButterflyDrag(position: Vector2(0,0), designNotifier: designNotifier));
      butterflies += 1;
    }
    super.update(dt);
  }
  
  @override
  Future<void> onLoad() {
     item.id = 0;
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
    designNotifier
  );
}


  void _addsText() {
    _textPaint = TextPaint(
      style: TextStyle(
        fontSize: size.x / 4,
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
    String hintText = "Hint";
    
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
        hintText = "Bravo!!! \n +${points} points";
      //  await helpers.openCustomDialog(
      //     context, 
      //     "Bravo!!!", 
      //     "You Gained ${points}", 
      //     Colors.green
      //   );
      }
      else{
        hintText = "Oopss!!! \n";
        hintText += isFake? "-${points} (Use natural flowers)" : "-${points} (Place on soil)";
        // await helpers.openCustomDialog(
        //   context, 
        //   "Oopss!!!", 
        //   isFake? "You Lost ${points} (Use natural flowers)" : "You Lost ${points} (Place on soil)", 
        //   Colors.red
        // );
      }

     designNotifier.setHintText(hintText);
     designNotifier.setPoints(points);
     designNotifier.showButterflyDialog(context);
  }

}
  