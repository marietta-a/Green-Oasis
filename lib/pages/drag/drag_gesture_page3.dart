import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/pages/drag/conservation_drag.dart';
import 'package:green_oasis/pages/tap/paper_tap.dart';
import 'package:green_oasis/pages/tap/paper_tap1.dart';
import 'package:green_oasis/pages/widgets/paper_widget.dart';


class DragGesturePage3 extends StatelessWidget {
  final DesignModel designNotifier;
  const DragGesturePage3({super.key, required this.designNotifier});
  

  @override
  Widget build(BuildContext context) {
    final soilVector = Vector2(helpers.tileSize * 5, helpers.tileSize * 2.5);
    final butterflyVecor = Vector2(soilVector.x, soilVector.y + 30);
    final soilComponent =  SoilDrag(position: soilVector,);
    final paperSize = Vector2.all(18);
    final tileSize = helpers.tileSize; 

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
                    initPosition: helpers.worldInitPosition,
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
                    Paper1Tap(position: Vector2.all(30), size: paperSize, designNotifier: designNotifier),
                  ],
              );
      }
    );

  }
  
}

// class ResponsiveScreen {
// }
