import 'package:bonfire/bonfire.dart';

class CommonSpriteSheet {
  static Future<SpriteAnimation> get butterflyAnimation => SpriteAnimation.load(
        "conservation/butterfly_sprite.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.6,
          textureSize: Vector2.all(11.2),
        ),
      );
  static Future<SpriteAnimation> get circleAnimation => SpriteAnimation.load(
        "conservation/circle.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.6,
          textureSize: Vector2.all(16),
        ),
      );

}
