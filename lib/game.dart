import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  late SpriteComponent house;
  late SpriteComponent plant1;
  late SpriteComponent plant2;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Load sprites
    final houseSprite = await Sprite.load('house.png');
    final plant1Sprite = await Sprite.load('plant.png');
    final plant2Sprite = await Sprite.load('plant2.png');

    // Create and position sprites
    house = SpriteComponent(
      sprite: houseSprite,
      size: Vector2(200, 150),
      position: Vector2(size.x / 2, size.y - houseSprite.originalSize.y),
    );
    plant1 = SpriteComponent(
      sprite: plant1Sprite,
      size: Vector2(50, 70),
      position: Vector2(size.x / 4, size.y - plant1Sprite.originalSize.y),
      // position: Vector2(size.x / 4, size.y - plant1Sprite.height),
    );
    plant2 = SpriteComponent(
      sprite: plant2Sprite,
      size: Vector2(50, 70),
      position: Vector2(size.x * 3 / 4, size.y - plant2Sprite.originalSize.y),
    );

    // Add sprites to the game
    add(house);
    add(plant1);
    add(plant2);
  }
}

class GreenOasis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Oasis',
      home: GameWidget(game: MyGame()),
    );
  }
}