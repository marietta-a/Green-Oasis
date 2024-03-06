
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/audio/sounds.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/components/house.dart';
import 'package:green_oasis/components/plant.dart';
import 'package:green_oasis/game_internals/level_state.dart';
import 'package:green_oasis/game_internals/score.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/player_progress/player_progress.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

const helpers = Helpers();
class PlantDesigner extends StatefulWidget{
  PlantDesigner({super.key, required this.designNotifier});
  final DesignModel designNotifier;

  @override
  State<StatefulWidget> createState() => _PlantDesigner(designNotifier);
  
}
class _PlantDesigner extends State<PlantDesigner>{

  _PlantDesigner(this.designNotifier);

  
  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();
  }

  static final _log = Logger('PlaySessionScreen');

  static const _celebrationDuration = Duration(milliseconds: 2000);

  static const _preCelebrationDuration = Duration(milliseconds: 500);

  bool _duringCelebration = false;

  late DateTime _startOfPlay;

  final DesignModel designNotifier;

  final widgets = <MyAnimatableElement>[
    const MyAnimatableElement(
      src: Flower1.src, 
      isArtifical: false,
      child: Flower1()
    ),
    const MyAnimatableElement(
      src: Plant.src,
      isArtifical: false,
      child: Plant()
     ),
    const MyAnimatableElement(
      src: FlowerArtificial.src, 
      isArtifical: true,
      child: FlowerArtificial(),
       
    ),
    const MyAnimatableElement(
      src: Flower.src, 
      isArtifical: false,
      child: Flower()
    ),
    const MyAnimatableElement(
      src: Plant2.src, 
      isArtifical: false,
      child: Plant2()
    ),
    const MyAnimatableElement(
      src: FlowerArtificial2.src, 
      isArtifical: true,
      child: FlowerArtificial2()
    ),
    const MyAnimatableElement(
      src: FlowerArtificial1.src, 
      isArtifical: true,
      child: FlowerArtificial1()
    ),
  ];
  


  
  @override
  Widget build(BuildContext context) {
        // The GestureDetector wraps the button.
    return MultiProvider(
        providers: [
          Provider.value(value: designNotifier.level),
          // Create and provide the [LevelState] object that will be used
          // by widgets below this one in the widget tree.
          ChangeNotifierProvider(
            create: (context) => LevelState(
              goal: designNotifier.level.difficulty,
              onWin: _playerWon,
              onLose: _playerLost
            ),
          ),
        ],
        builder:  (BuildContext context, Widget? child){
          
          final levelState = context.watch<LevelState>();
          return   IgnorePointer(
          // Ignore all input during the celebration animation.
              ignoring: _duringCelebration,
              child: Flex(
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        direction: Axis.vertical,
                        children: <Widget>[
                          for(final item in widgets)
                            Container(
                              // A fixed-height child. // Yellow
                              color: const Color(0xffeeee00),
                              height: helpers.itemSize.y,
                              alignment: Alignment.center,
                              child: GestureDetector(
                                child:  Card(
                                    elevation: 2,
                                    borderOnForeground: true,
                                    child: item
                                  ),
                                  onTap: () {
                                    setState(() {
                                        designNotifier.addPlants(item);

                                        final conservablePlants = designNotifier.plants.where((element) => !element.isArtifical);
                                        final points = item.isArtifical ? levelState.progress - 20 : (conservablePlants.length * 20);
                                        final pointsGained = levelState.progress > points ? levelState.progress - points : points - levelState.progress;
                                        final title = "total points = $points";
                                        
                                        if(item.isArtifical){
                                           helpers.openCustomDialog(context, title, 'you lost 20 points for using and Artificial flower', Colors.red);
                                        }
                                        else{
                                          
                                           helpers.openCustomDialog(context, title, 'you gained $pointsGained points for using natural plants', Colors.green);
                                        }

                                        levelState.setProgress(points);
                                        levelState.evaluate();
                                          
                                        

                                          // final snackBar = SnackBar(content: Text(levelState.progress.toString()));

                                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    });

                                  }
                              ),
                            ),
                        ],
                      )
          );
        }
    );

  }

  Future<void> _playerLost() async {
    _log.info('Level ${designNotifier.level.number} failed');

    final score = Score(
      designNotifier.level.number,
      designNotifier.level.difficulty,
      DateTime.now().difference(_startOfPlay),
    );

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(designNotifier.level.number);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _duringCelebration = true;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.wssh);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/play/lost', extra: {'score': score});
  }

  Future<void> _playerWon() async {
    _log.info('Level ${designNotifier.level.number} won');

    final score = Score(
      designNotifier.level.number,
      designNotifier.level.difficulty,
      DateTime.now().difference(_startOfPlay),
    );

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(designNotifier.level.number);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    setState(() {
      _duringCelebration = true;
    });

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.congrats);

    /// Give the player some time to see the celebration animation.
    await Future<void>.delayed(_celebrationDuration);
    if (!mounted) return;

    GoRouter.of(context).go('/play/won', extra: {'score': score});
  }
}

class HouseDesigner extends StatefulWidget{

  const HouseDesigner({super.key, required this.designNotifier});
  final DesignModel designNotifier;

   
  @override
  State<StatefulWidget> createState() => _HouseDesigner(designNotifier);
  
}
class _HouseDesigner extends State<HouseDesigner>{
  
  _HouseDesigner(this.designNotifier);

  final DesignModel designNotifier;

  final widgets = <MyAnimatableElement> [
     const MyAnimatableElement(
      src: House.src, 
      isArtifical: false,
      child: House(),
    ),
     const MyAnimatableElement(
      src: House1.src, 
      isArtifical: false,
      child: House1(),
    ),
     const MyAnimatableElement(
      src: House2.src, 
      isArtifical: false,
      child: House2(),
    ),
  ];


  @override
  Widget build(BuildContext context) {
   designNotifier.clearHouses();
   designNotifier.addHouses(widgets[1]);
    // return MaterialApp(
    //   title: 'Green Oasis',
    //   home: GameWidget(game: Houses()),
      
    // );
     return Flex(
       // mainAxisSize: MainAxisSize.min,
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
       direction: Axis.vertical,
       children: <Widget>[
         for(final item in widgets)
           Container(
             // A fixed-height child. // Yellow
             color: const Color(0xffeeee00),
             height: helpers.itemSize.y,
             alignment: Alignment.center,
             child: GestureDetector(
              child:  Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: item
                ),
                onTap: () {
                  setState(() {

                      designNotifier.clearHouses();
                      designNotifier.addHouses(item);
                  });

                  // const snackBar = SnackBar(content: Text('Tap'));

                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
             ),
           ),
       ],
     );
  }
}

