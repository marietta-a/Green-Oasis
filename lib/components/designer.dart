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
      return  Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
                    children: [
                        /*1*/
                      for(final item in designNotifier.houses)
                        SizedBox(
                            height: 400,
                            width: 200,
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
                      for(final item in designNotifier.plants)
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: GestureDetector(
                                child: item,
                                onTap: (){
                                  designNotifier.removePlant(item);
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



  