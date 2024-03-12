import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/pages/drag/conservation_drag.dart';
import 'package:green_oasis/pages/drag/flower1_drag.dart';
import 'package:green_oasis/pages/drag/flower2_drag.dart';
import 'package:green_oasis/pages/drag/flower3_drag.dart';
import 'package:green_oasis/pages/drag/flower4_drag.dart';
import 'package:green_oasis/pages/drag/flower5_drag.dart';
import 'package:green_oasis/pages/drag/flower6_drag.dart';
import 'package:green_oasis/pages/drag/flower7_drag.dart';
import 'package:green_oasis/pages/drag/flower8_drag.dart';
import 'package:green_oasis/pages/drag/flower_art1_drag.dart.dart';
import 'package:green_oasis/pages/drag/flower_art2_drag.dart.dart';
import 'package:green_oasis/pages/drag/flower_art3_drag.dart.dart';
import 'package:green_oasis/pages/drag/flower_drag.dart';
import 'package:green_oasis/pages/drag/l2art.dart.dart';
import 'package:green_oasis/pages/drag/l2art1.dart.dart';
import 'package:green_oasis/pages/drag/l2art2.dart.dart';
import 'package:green_oasis/pages/drag/l2art3.dart.dart';
import 'package:green_oasis/pages/drag/l2art4.dart.dart';
import 'package:green_oasis/pages/drag/l2art5.dart.dart';
import 'package:green_oasis/pages/drag/l2flower.dart.dart';
import 'package:green_oasis/pages/drag/l2flower1.dart.dart';
import 'package:green_oasis/pages/drag/l2flower3.dart.dart';
import 'package:green_oasis/pages/drag/l2flower4.dart.dart';
import 'package:green_oasis/pages/drag/l2flower5.dart.dart';
import 'package:green_oasis/pages/drag/l2flower6.dart.dart';
import 'package:green_oasis/pages/drag/l2flower7.dart.dart';
import 'package:green_oasis/pages/drag/l2flower8.dart.dart';
import 'package:green_oasis/pages/drag/l2flower9.dart.dart';
import 'package:green_oasis/pages/drag/l2flowerA.dart.dart';
import 'package:green_oasis/pages/drag/l2flowerB.dart.dart';
import 'package:green_oasis/pages/drag/l2flowerC.dart.dart';
import 'package:green_oasis/pages/tap/paper_tap.dart';


const tileSize = 16.0;
final soilVector = Vector2(tileSize * 5, tileSize * 2.5);
final butterflyVecor = Vector2(soilVector.x, soilVector.y + 30);
class DragGesturePage2 extends StatelessWidget {
  final DesignModel designNotifier;
  DragGesturePage2({Key? key, required this.designNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final soilComponent =  SoilDrag(position: soilVector,);
    final paperSize = Vector2.all(25);

    return ListenableBuilder(
      listenable: designNotifier, 
      builder: (context, constraints){

        return BonfireWidget(
                  map: WorldMapByTiled(
                    // TiledReader.asset('tiled/tiled_example.tmj'),
                    TiledReader.asset('tiled/punnyworld/simple_map.tmj'),
                  ),
                  cameraConfig: CameraConfig(
                    zoom: getZoomFromMaxVisibleTile(context, tileSize, 34),
                    initPosition: Vector2(tileSize * 7, tileSize * 6),
                  ),
                  components: [
                    soilComponent,
                    HouseDrag(
                      position: Vector2(tileSize * 5, tileSize * 1),
                    ),
                    House1Drag(
                      position: Vector2(tileSize * 9, tileSize * 1),
                    ),
                    FlowerStaticAnim(position: Vector2(soilVector.x, soilVector.y + 17), designNotifier: designNotifier),
                    FlowerStaticAnim(position: Vector2(soilVector.x, soilVector.y + (17*2)), designNotifier: designNotifier),
                    FlowerStaticAnim(position: Vector2(soilVector.x, soilVector.y + (17*3)), designNotifier: designNotifier),
                    Flower1Static(position: Vector2(soilVector.x, soilVector.y + (17*4))),
                    FlowerStaticAnim(position: Vector2(soilVector.x, soilVector.y + (17*4.2)), designNotifier: designNotifier),
                   
                    FlowerStatic(position: Vector2(soilVector.x + 25, soilVector.y + 17), designNotifier: designNotifier),
                    FlowerStatic(position: Vector2(soilVector.x + 25, soilVector.y + (17 * 2)), designNotifier: designNotifier),
                    FlowerStaticAnim1(position: Vector2(soilVector.x + 25, soilVector.y + (17 * 3)), designNotifier: designNotifier),
                    FlowerStatic(position: Vector2(soilVector.x + 25, soilVector.y + (17 * 4)), designNotifier: designNotifier),
                    FlowerStatic(position: Vector2(soilVector.x + 25, soilVector.y + (17 * 4.2)), designNotifier: designNotifier),

                    FlowerStaticAnim(position: Vector2(soilVector.x + (25*2), soilVector.y + 17), designNotifier: designNotifier),
                    FlowerStaticAnim(position: Vector2(soilVector.x + (25*2), soilVector.y + (17*2)), designNotifier: designNotifier),
                    Flower1Static(position: Vector2(soilVector.x + (25*2), soilVector.y + (17*3))),
                    Flower1Static(position: Vector2(soilVector.x + (25*2), soilVector.y + (17*4))),
                    Flower1Static(position: Vector2(soilVector.x + (25*2), soilVector.y + (17*4.2))),
                   
                    FlowerStaticAnim1(position: Vector2(soilVector.x + (25*3), soilVector.y + 17), designNotifier: designNotifier),
                    FlowerStatic(position: Vector2(soilVector.x + (25*3), soilVector.y + (17 * 2)), designNotifier: designNotifier),
                    FlowerStaticAnim1(position: Vector2(soilVector.x + (25*3), soilVector.y + (17 * 3)), designNotifier: designNotifier),
                    FlowerStaticAnim1(position: Vector2(soilVector.x + (25*3), soilVector.y + (17 * 4)), designNotifier: designNotifier),
                    FlowerStaticAnim1(position: Vector2(soilVector.x + (25*3), soilVector.y + (17 * 4.2)), designNotifier: designNotifier),

                    PaperTap(position: Vector2.all(0), size: paperSize, designNotifier: designNotifier),
                  ],
              );
      }
    );

  }
  
}

// class ResponsiveScreen {
// }
