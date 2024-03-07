import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/pages/drag/conservation_drag.dart';

class DragGesturePage extends StatelessWidget {
  final DesignModel designNotifier;
  DragGesturePage({Key? key, required this.designNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    final soilVector = Vector2(tileSize * 5, tileSize * 2.5);
    final soilComponent =  SoilDrag(position: soilVector,);

   return BonfireWidget(
          map: WorldMapByTiled(
            // TiledReader.asset('tiled/tiled_example.tmj'),
            TiledReader.asset('tiled/punnyworld/simple_map.tmj'),
          ),
          cameraConfig: CameraConfig(
            zoom: getZoomFromMaxVisibleTile(context, tileSize, 32),
            initPosition: Vector2(tileSize * 7, tileSize * 6),
          ),
          components: [
            // BarrelDrag(
            //   position: Vector2(tileSize * 5, tileSize * 5),
            // ),
            soilComponent,
            HouseDrag(
              position: Vector2(tileSize * 5, tileSize * 1),
            ),
            House1Drag(
              position: Vector2(tileSize * 9, tileSize * 1),
            ),
            FlowerDrag(
              position: Vector2(tileSize * 0, tileSize * 0),
              parentPosition: soilVector,
              parentSize: soilComponent.size, 
              onDragEnd: (){
                designNotifier.setPoints(10);
              },
              designNotifier: designNotifier
            ),
            // FlowerArtificialDrag(
            //   position: Vector2(tileSize * 0, tileSize * 8),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // Flower1Drag(
            //   position: Vector2(tileSize * 0, tileSize * 2),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // Flower2Drag(
            //   position: Vector2(tileSize * 0, tileSize * 4),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // Flower4Drag(
            //   position: Vector2(tileSize * 0, tileSize * 6),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // Flower5Drag(
            //   position: Vector2(tileSize * 13, tileSize * 0),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // Flower6Drag(
            //   position: Vector2(tileSize * 13, tileSize * 2),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // FlowerArtificial1Drag(
            //   position: Vector2(tileSize * 13, tileSize * 4),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // FlowerArtificial2Drag(
            //   position: Vector2(tileSize * 13, tileSize * 6),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            // Flower3Drag(
            //   position: Vector2(tileSize * 13, tileSize * 8),
            //   parentPosition: soilVector,
            //   parentSize: soilComponent.size
            // ),
            
          ],
      );
      // return Scaffold(
      //   backgroundColor: Colors.green,
      //   body:  Expanded(
      //           child: LayoutBuilder(
      //                   builder: (BuildContext context, BoxConstraints viewportConstraints) {
                          

      //                     return SingleChildScrollView(
      //                       child: ConstrainedBox(
      //                         constraints: BoxConstraints(
      //                           minHeight: viewportConstraints.minHeight,
      //                           minWidth: viewportConstraints.minWidth
      //                         ),
      //                         child: Row(
      //                           children: [
      //                             // Row(
      //                             //   // mainAxisSize: MainAxisSize.min,
      //                             //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                             //   // direction: Axis.horizontal,
                                  
      //                             //   children: <Widget>[
      //                             //     Container(
      //                             //       // A fixed-height child.
      //                             //       color: helpers.cardColor, // Yellow
      //                             //       height: viewportConstraints.minHeight,
      //                             //       alignment: Alignment.center,
      //                             //       child: HouseDesigner(designNotifier: designNotifier)
      //                             //     ),
      //                             //     Container(
      //                             //       // Another fixed-height child.
      //                             //       color: helpers.cardColor, // Green
      //                             //       height: viewportConstraints.minHeight,
      //                             //       alignment: Alignment.center,
      //                             //       child: PlantDesigner(designNotifier: designNotifier)
      //                             //     ),
      //                             //   ],
      //                             // ),
      //                             Container(
      //                               // direction: Axis.horizontal,
      //                                 child: BonfireWidget(
      //                                   map: WorldMapByTiled(
      //                                     // TiledReader.asset('tiled/tiled_example.tmj'),
      //                                     TiledReader.asset('tiled/punnyworld/simple_map.tmj'),
      //                                   ),
      //                                   cameraConfig: CameraConfig(
      //                                     zoom: getZoomFromMaxVisibleTile(context, tileSize, 30),
      //                                     initPosition: Vector2(tileSize * 5, tileSize * 7),
      //                                   ),
      //                                   components: [
      //                                     // BarrelDrag(
      //                                     //   position: Vector2(tileSize * 5, tileSize * 5),
      //                                     // ),
      //                                     HouseDrag(
      //                                       position: Vector2(tileSize * 5, tileSize * 5),
      //                                     ),
      //                                     PlantDrag(
      //                                       position: Vector2(tileSize * 4.7, tileSize * 4.7),
      //                                     ),
      //                                     Plant1Drag(
      //                                       position: Vector2(tileSize * 4.6, tileSize * 4.6),
      //                                     ),
      //                                     PlantDrag(
      //                                       position: Vector2(tileSize * 4.5, tileSize * 4.5),
      //                                     ),
                                          
      //                                   ],
      //                               ),
      //                             )
      //                           ],
      //                         )
      //                       ),
      //                     );
      //                   },
      //                 ),
      //         ),
      //     );
    
    }
  
}

// class ResponsiveScreen {
// }
