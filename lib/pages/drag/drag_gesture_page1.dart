import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/pages/drag/conservation_drag.dart';
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
import 'package:green_oasis/pages/drag/l2flower9.dart.dart';
import 'package:green_oasis/pages/drag/l2flowerA.dart.dart';
import 'package:green_oasis/pages/drag/l2flowerB.dart.dart';
import 'package:green_oasis/pages/drag/l2flowerC.dart.dart';


const tileSize = 16.0;
final soilVector = Vector2(tileSize * 5, tileSize * 2.5);
final butterflyVecor = Vector2(soilVector.x, soilVector.y + 30);
class DragGesturePage1 extends StatelessWidget {
  final DesignModel designNotifier;
  const DragGesturePage1({super.key, required this.designNotifier});

  @override
  Widget build(BuildContext context) {
    final soilComponent =  SoilDrag(position: soilVector,);

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
                    FlowerDragLevel2(
                      childPosition: Vector2(tileSize * 0, tileSize * 0),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerDrag1Level2(
                      childPosition: Vector2(tileSize * 0, tileSize * 2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial4DragL2(
                      childPosition: Vector2(tileSize * 0, tileSize * 4),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerDrag2Level2(
                      childPosition: Vector2(tileSize * 0, tileSize * 6),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial3DragL2(
                      childPosition: Vector2(tileSize * 0, tileSize * 8),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower3DragLevel2(
                      childPosition: Vector2(tileSize * 0, tileSize * 10),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower4DragLevel2(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 0),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial2DragL2(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower5DragLevel2(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 4),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower6DragLevel2(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 6),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial5DragL2(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 8),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    Flower8DragLevel2(
                      childPosition: Vector2(tileSize * 13.1, tileSize * 10),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerADragLevel2(
                      childPosition: Vector2(tileSize * 2, tileSize * -0.2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificialDragL2(
                      childPosition: Vector2(tileSize * 4 , tileSize * -0.2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerBDragLevel2(
                      childPosition: Vector2(tileSize * 6, tileSize * -0.2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerCDragLevel2(
                      childPosition: Vector2(tileSize * 8, tileSize * -0.2),
                      parentPosition: soilVector,
                      parentSize: soilComponent.size,
                      designNotifier: designNotifier
                    ),
                    FlowerArtificial1DragL2(
                      childPosition: Vector2(tileSize * 10 , tileSize * -0.2),
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
