import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/shared/util/conservation_sprite.dart';


const helpers = Helpers();
final spriteSize = Vector2.all(25);




class PlantDrag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  PlantDrag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.plantSprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Plant1Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  Plant1Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.plant1Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Plant2Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  Plant2Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.plant2Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Plant3Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  Plant3Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.plant3Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Plant4Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  Plant4Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.plant4Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Plant5Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  Plant5Drag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.plant5Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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


class FlowerDrag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  final VoidCallback onDragEnd;
  final DesignModel designNotifier;
  FlowerDrag({required super.position, required this.parentPosition, required this.parentSize, required this.onDragEnd, required this.designNotifier})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
        );


  @override
  Future<void> onLoad() {
    _addsText();
    return super.onLoad();
  }

  @override
  bool handlerPointerUp(PointerUpEvent event) {
    onDragEnd;
    return super.handlerPointerUp(event);
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
        text: designNotifier.getPointText(),
        position: Vector2((textSize.x / -2) + size.x / 2, -5),
        textRenderer: _textPaint,
      ),
    );
  }
}


class Flower1Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower1Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flower1Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Flower2Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower2Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Flower3Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower3Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Flower4Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower4Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class Flower5Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower5Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
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


class Flower6Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower6Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
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


class Flower7Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  Flower7Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerSprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class FlowerArtificialDrag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  FlowerArtificialDrag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerart2Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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

class FlowerArtificial1Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  FlowerArtificial1Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerart2Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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



class FlowerArtificial2Drag extends GameDecoration with DragGesture, Movement {
  late TextPaint _textPaint;
  final String text = 'Drag me';
  final Vector2 parentPosition;
  final Vector2 parentSize;
  FlowerArtificial2Drag({required super.position, required this.parentPosition, required this.parentSize})
      : super.withSprite(
          sprite: ConservationSpriteSheet.flowerart2Sprite,
          size: spriteSize,
          renderAboveComponents: true,
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
  final String text = 'Drag me';
  SoilDrag({required super.position})
      : super.withSprite(
          sprite: ConservationSpriteSheet.soilSprite,
          size: Vector2.all(100),
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