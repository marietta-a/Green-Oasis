


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
    with TapGesture, Movement{
  PaperTap({required super.position, required super.size, required this.designNotifier});
  
  late GameDecoration spriteComponent = GameDecoration(position: position, size: size);
  final DesignModel designNotifier;

  @override
  void onTap() {
    designNotifier.setPoints(200);
    designNotifier.setLitterFound(true);
    remove(spriteComponent);
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