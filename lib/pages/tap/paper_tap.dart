


import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/components/design_selectors.dart';
import 'package:green_oasis/shared/util/conservation_sprite.dart';

class Paper extends GameDecoration{
  Paper({required super.position,  required super.size}): super.withSprite(
      sprite: ConservationSpriteSheet.paperSprite,
      renderAboveComponents: true
    );
}

class PaperTap extends GameDecoration
    with TapGesture{
  PaperTap({required super.position, required super.size, required this.designNotifier});
  
  late GameDecoration spriteComponent = GameDecoration(position: position, size: size);
  final DesignModel designNotifier;
  
  @override
  bool handlerPointerUp(PointerUpEvent event) {
    
    final tapEvent = GestureEvent.fromPointerEvent(
      event,
      screenToWorld: gameRef.screenToWorld,
    );
    // print(position);
    // print(tapEvent.worldPosition);
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


    spriteComponent = Paper(size: size, position: position);
    add(spriteComponent);
    add(RectangleHitbox(size: size));
    
    helpers.openCustomDialog(context,
     "", "Let's tidy up!!! \n  Someone littered your environtment, find and select litter to complete this challenge",
      Colors.green
    );

    return super.onLoad();
  }

}