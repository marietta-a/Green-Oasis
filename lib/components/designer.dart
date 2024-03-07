import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/audio/sounds.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/game_internals/level_state.dart';
import 'package:green_oasis/game_internals/score.dart';
import 'package:green_oasis/level_selection/levels.dart';
import 'package:green_oasis/player_progress/player_progress.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';


class Designer extends StatefulWidget{
    
  final GameLevel level;
  Designer({super.key, required this.designNotifier, required this.level});

  final DesignModel designNotifier;
  
  @override
  State<StatefulWidget> createState() => _Designer(designNotifier: designNotifier);
}


class _Designer extends State<Designer>{
  _Designer({required this.designNotifier});

  final DesignModel designNotifier;



  @override
  Widget build(BuildContext context) {

   designNotifier.setGameLevel(widget.level);

    return  ListenableBuilder(listenable: designNotifier, 
    builder: (context, child){
      final plantsLength = designNotifier.plants.length;
      final plantsMidLength = plantsLength / 2;
      var i = 0;
      return  Flexible(
            // padding: const EdgeInsets.all(32),
            fit: FlexFit.tight,
            child: Row(
                    children: [
                        /*1*/
                      for( ; i < plantsMidLength; i++)
                        SizedBox(
                            height: 100,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: GestureDetector(
                                child: designNotifier.plants[i],
                                onTap: (){
                                  designNotifier.removePlant(designNotifier.plants[i]);
                                }
                              ),
                            )
                      ),

                      for(final item in designNotifier.houses)
                        SizedBox(
                            height: 400,
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: GestureDetector(
                                child: item,
                                onTap: (){
                                  // designNotifier.removeHouse(item);
                                }
                              ),
                            )
                        ),
                      for(; i < plantsLength; i++)
                        SizedBox(
                            height: 100,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: GestureDetector(
                                child: designNotifier.plants[i],
                                onTap: (){
                                  designNotifier.removePlant(designNotifier.plants[i]);
                                }
                              ),
                            )
                      ),
                    ]
            )
        );
      }
    );
  }
}



  