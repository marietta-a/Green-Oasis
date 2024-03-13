import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/pages/drag/drag_gesture_page.dart';
import 'package:green_oasis/shared/util/common_sprite_sheet.dart';
import 'package:green_oasis/shared/util/conservation_sprite.dart';


final spriteSize = Vector2.all(25);
const helpers = Helpers();


class HouseDrag extends GameDecoration with Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  HouseDrag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.houseSprite,
          size: Vector2.all(32),
        );

  @override
  Future<void> onLoad() {
    // _addsText();
    return super.onLoad();
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

class House1Drag extends GameDecoration with Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  House1Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.house1Sprite,
          size: Vector2.all(32),
        );

  @override
  Future<void> onLoad() {
    // _addsText();
    return super.onLoad();
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


class House2Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  House2Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.house2Sprite,
          size: spriteSize,
        );

  @override
  Future<void> onLoad() {
    _addsText();
    return super.onLoad();
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


class SoilDrag extends GameDecoration {
  late TextPaint _textPaint;
  final String text = 'Garden';
  SoilDrag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.soilSprite,
          size: Vector2.all(100),
        );

  @override
  Future<void> onLoad() {
    _addsText();
    return super.onLoad();
  }

  void _addsText() {
    _textPaint = TextPaint(
      style: TextStyle(
        fontSize: 8,
        color: Colors.white,
      ),
    );
    var textSize = _textPaint.getLineMetrics(text).size;
    add(
      TextComponent(
        text: text,
        // position: Vector2((textSize.x / -2) + size.x / 2, -5),
        position: Vector2(soilVector.x - (tileSize * 2.5), soilVector.y + (tileSize)),
        textRenderer: _textPaint,
      ),
    );
  }
}

class ButterflyDrag extends AnimatedGameObject{
  final DesignModel designNotifier;
  ButterflyDrag({required super.position, required this.designNotifier})
      : super(
        size: Vector2.all(16),
        renderAboveComponents: true,
      );

  @override
  Future<void> onLoad() async {
    // final component  = SpriteAnimationComponent();
    // component.animation = await CommonSpriteSheet.butterflyAnimation;
    final component = SpriteAnimationComponent(
     animation: await CommonSpriteSheet.butterflyAnimation,
     position: position,
    //  size: Vector2.all(16),
    );
    add(component);
    sprite = await ConservationSpriteSheet.butterflySprite;
  }

}

class Flower1Static extends GameDecoration{
  Flower1Static({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true
        );

  @override
  Future<void> onLoad() {
    return super.onLoad();
  }
}

class FlowerStaticAnim extends GameDecoration{
  final DesignModel designNotifier;
  FlowerStaticAnim({required super.position, required this.designNotifier})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true
        );

  @override
  Future<void> onLoad() {
    add(ButterflyDrag(position: Vector2(0,0), designNotifier: designNotifier));
    return super.onLoad();
  }
}
class FlowerStaticAnim1 extends GameDecoration{
  final DesignModel designNotifier;
  FlowerStaticAnim1({required super.position, required this.designNotifier})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flower2Sprite,
          size: spriteSize,
          renderAboveComponents: true
        );

  @override
  Future<void> onLoad() {
    add(ButterflyDrag(position: Vector2(0,0), designNotifier: designNotifier));
    return super.onLoad();
  }
}



class FlowerStatic extends GameDecoration{
  final DesignModel designNotifier;
  FlowerStatic({required super.position, required this.designNotifier})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flower2Sprite,
          size: spriteSize,
          renderAboveComponents: true
        );

  @override
  Future<void> onLoad() {
    // add(ButterflyDrag(position: Vector2(0,0), designNotifier: designNotifier));
    return super.onLoad();
  }
}
class Paper2 extends GameDecoration{
  Paper2({required super.position,  required super.size}): super.withSprite(
    sprite: ConservationSpriteSheet.paperSprite,
    );
}
class Paper3 extends GameDecoration{
  Paper3({required super.position,  required super.size}): super.withSprite(
    sprite: ConservationSpriteSheet.paperSprite,
    );
}
class Paper4 extends GameDecoration{
  Paper4({required super.position,  required super.size}): super.withSprite(
    sprite: ConservationSpriteSheet.paperSprite,
    );
}



class Paper2Tap extends GameDecoration
    with TapGesture, Movement{
  Paper2Tap({required Vector2 position, required super.size}):super(position: position);
  
  late GameDecoration spriteComponent = GameDecoration(position: position, size: size);

  @override
  void onTap() {
    remove(spriteComponent);
  }

  @override
  Future<void> onLoad() {
    spriteComponent = Paper2(size: size, position: position);
    add(spriteComponent);
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

}


class Paper3Tap extends GameDecoration
    with TapGesture, Movement{
  Paper3Tap({required Vector2 position, required super.size}):super(position: position);
  
  late GameDecoration spriteComponent = GameDecoration(position: position, size: size);

  @override
  void onTap() {
    remove(spriteComponent);
  }

  @override
  Future<void> onLoad() {
    spriteComponent = Paper3(size: size, position: position);
    add(spriteComponent);
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

}


class Paper4Tap extends GameDecoration
    with TapGesture, Movement{
  Paper4Tap({required Vector2 position, required super.size}):super(position: position);
  
  late GameDecoration spriteComponent = GameDecoration(position: position, size: size);

  @override
  void onTap() {
    remove(spriteComponent);
  }

  @override
  Future<void> onLoad() {
    spriteComponent = Paper4(size: size, position: position);
    add(spriteComponent);
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

}




