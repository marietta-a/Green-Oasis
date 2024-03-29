
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';

// Fixed viewport size  
  

class MyGame extends FlameGame {
  MyGame({required this.zoom});
  final double zoom;
  final helpers = const Helpers();


  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewport = FixedResolutionViewport(resolution: helpers.screenSize);
  
  @override
  Color backgroundColor() => const Color(0x00000000);
    camera.viewfinder.zoom = zoom;

    // Add sprites to the game


    // addAll([
    //   AlignComponent(
    //     child: CircleComponent(
    //       radius: 40,
    //       children: [
    //        TextComponent(text: "Let's build a sustainable home"),
    //         SizeEffect.by(
    //           Vector2.all(25),
    //           EffectController(
    //             infinite: true,
    //             duration: 0.75,
    //             reverseDuration: 0.5,
    //           ),
    //         ),
    //       ],

    //     ),
    //     alignment: Anchor.center,
        
    //   ),
    //   // AlignComponent(
    //   //   child: CircleComponent(radius: 30),
    //   //   alignment: Anchor.topCenter,
    //   // ),
    // ]);
  }

  
}

// Helper component that paints a black background  
class _Background extends PositionComponent {  
  _Background();
  
  set positionType(PositionType positionType) {}  
  
  @override  
  void render(Canvas canvas) {  
    var blackPaint = Paint();
    blackPaint.color = Colors.red;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), blackPaint);  
  }  
}

class GreenOasis extends StatelessWidget {
  const GreenOasis({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Oasis',
      home: GameWidget(game: MyGame(zoom: 100)),
      
    );
  }
}