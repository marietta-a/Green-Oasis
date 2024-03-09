import 'dart:async';
import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/helpers/helpers.dart';
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
  final String text = 'Soil';
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