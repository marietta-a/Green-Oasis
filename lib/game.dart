import 'dart:html';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/garden.dart';
import 'package:green_oasis/components/house.dart';
import 'package:green_oasis/components/plant.dart';
import 'package:green_oasis/helpers/helpers.dart';

// Fixed viewport size  
  

class MyGame extends FlameGame {
  MyGame({required this.zoom});
  final double zoom;


  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewport = FixedResolutionViewport(resolution: screenSize);
  
  @override
  Color backgroundColor() => const Color(0x00000000);
    // Load sprites
    // final houseSprite = await Sprite.load('house.png');

    // // Create and position sprites
    // house = SpriteComponent(
    //   sprite: houseSprite,
    //   size: Vector2(200, 150),
    //   position: Vector2(size.x / 2, size.y - houseSprite.originalSize.y),
    // );

    camera.viewfinder.zoom = zoom;

    // Adds a black background to the viewport  
    // await add(_Background(size: screenSize)..positionType = PositionType.viewport);  
    // Add sprites to the game
    add(House1());
    add(Soil());
    add(Plant1());

  }
}

// Helper component that paints a black background  
class _Background extends PositionComponent {  
  _Background({super.size});
  
  set positionType(PositionType positionType) {}  
  
  @override  
  void render(Canvas canvas) {  
    var blackPaint = Paint();
    blackPaint.color = Colors.red;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), blackPaint);  
  }  
}

class GreenOasis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Oasis',
      home: GameWidget(game: MyGame(zoom: 100)),
      // home: GameWidget(game: DragEventsGame()),
    );
  }
}