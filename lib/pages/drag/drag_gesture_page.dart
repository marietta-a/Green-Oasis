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


const tileSize = 16.0;
final soilVector = Vector2(tileSize * 5, tileSize * 2.5);
final butterflyVecor = Vector2(soilVector.x, soilVector.y + 30);
class DragGesturePage extends StatelessWidget {
  final DesignModel designNotifier;
  const DragGesturePage({super.key, required this.designNotifier});

  

  @override
  Widget build(BuildContext context) {
    final soilComponent =  SoilDrag(position: soilVector,);

   return ListenableBuilder(
      listenable: designNotifier, 
      builder: (context, constraints){

        return BonfireWidget(
                  key: Key("bonfire ${designNotifier.level.number}"),
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
                    FlowerDrag(
                      childPosition: Vector2(tileSize * 0, tileSize * 0),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower1Drag(
                      childPosition: Vector2(tileSize * 0, tileSize * 2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial1Drag(
                      childPosition: Vector2(tileSize * 0, tileSize * 4),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower2Drag(
                      childPosition: Vector2(tileSize * 0, tileSize * 6),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial2Drag(
                      childPosition: Vector2(tileSize * 0, tileSize * 8),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower3Drag(
                      childPosition: Vector2(tileSize * 0, tileSize * 10),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower4Drag(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 0),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial3Drag(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower5Drag(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 4),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower6Drag(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 6),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower7Drag(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 8),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower8Drag(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 10),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                  ],
              );
      }
    );

  }
  
}

// class ResponsiveScreen {
// }
