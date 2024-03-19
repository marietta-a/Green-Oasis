


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
    
    gameRef.screenToWorld(position);

    if(contains(spriteComponent) && isWithinRange(event)){
      remove(spriteComponent);
      designNotifier.setPoints(100);
    }
    return super.handlerPointerUp(event);
  }
  isWithinRange( PointerUpEvent e){
    final tapEvent = GestureEvent.fromPointerEvent(
      e,
      screenToWorld: gameRef.screenToWorld,
    );
      final xx = position.x + size.x;
      final yy = position.y + size.y;
      final globPosition = (e.position / gameRef.camera.zoom);
      final worldX = tapEvent.worldPosition.x.round() + gameRef.camera.position.x.round();
      final worldY = tapEvent.worldPosition.y.round() + gameRef.camera.position.y.round();
      final localX = (globPosition.dx.round() - worldX.round()).round();
      final localY = (globPosition.dy.round() - worldY.round()).round();
      final isValidX = position.x.round() <= localX && xx >= localX;
      final isValidY = position.y.round() <= localY && yy >= localY;
      print(localX);
      print(localY);
      print(position);
      print(globPosition);
      print(tapEvent.worldPosition);
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