
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Helpers{
  Vector2 get screenSize => Vector2(1920, 1080); 

  // house helpers
  Vector2 get housePosition => Vector2(screenSize.x/4, 0); 
  Vector2 get houseSize => Vector2.all(400);

  //plants helpers
  Vector2 get plantSize => Vector2.all(200);
  Vector2 get plantPosition => Vector2(screenSize.x/2, 80);

  // garden helpers

  Vector2 get gardenSize => Vector2(600, 200);
  Vector2 get gardenPosition => Vector2(screenSize.x/2, 80);
}