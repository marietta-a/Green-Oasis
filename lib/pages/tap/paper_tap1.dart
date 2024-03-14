


import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/components/design_selectors.dart';
import 'package:green_oasis/shared/util/conservation_sprite.dart';

class Paper1 extends GameDecoration{
  Paper1({required super.position,  required super.size}): super.withSprite(
      sprite: ConservationSpriteSheet.paperSprite,
      renderAboveComponents: true
    );
}

class Paper1Tap extends GameDecoration
    with TapGesture{
  Paper1Tap({required super.position, required super.size, required this.designNotifier});
  
  late GameDecoration spriteComponent = GameDecoration(position: position, size: size);
  final DesignModel designNotifier;
  
  @override
  bool handlerPointerUp(PointerUpEvent event) {
    final tapEvent = GestureEvent.fromPointerEvent(
      event,
      screenToWorld: gameRef.screenToWorld,
    );
    print(event.position);
    if(contains(spriteComponent) && isWithinRange(tapEvent.worldPosition)){
      remove(spriteComponent);
      designNotifier.setPoints(100);
    }
    return super.handlerPointerUp(event);
  }
  isWithinRange( Vector2 pointerPos){
      final xx = position.x + size.x;
      final yy = position.y + size.y;
      final isValidX = position.x <= pointerPos.x && xx >= pointerPos.x;
      final isValidY = position.y <= pointerPos.y && yy >= pointerPos.y;
      var screenSize = MediaQuery.of(context).size;
      var x1 = helpers.worldInitPosition.x + gameRef.worldsize.x;
      print(screenSize);
      print(x1);
      print(gameRef.worldsize);
      print(helpers.worldInitPosition);
      print(pointerPos);
      print("xx: $xx yy: $yy");
      print("____________");
      return  isValidY && isValidX;
  }

  @override
  void onTap() {
    // designNotifier.setPoints(100);
    // designNotifier.setLitterFound(true);
    // remove(spriteComponent);
  }

  @override
  Future<void> onLoad() async{


    spriteComponent = Paper1(size: size, position: position);
    add(spriteComponent);
    add(RectangleHitbox(size: size));
    

    return super.onLoad();
  }

}