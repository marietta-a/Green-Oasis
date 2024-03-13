
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/audio/sounds.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/game_internals/level_state.dart';
import 'package:green_oasis/game_internals/score.dart';
import 'package:green_oasis/level_selection/levels.dart';
import 'package:green_oasis/pages/drag/conservation_drag.dart';
import 'package:green_oasis/pages/drag/drag_gesture_page.dart';
import 'package:green_oasis/player_progress/player_progress.dart';
import 'package:green_oasis/style/palette.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class Level1Page extends StatefulWidget{
  const Level1Page({super.key, required this.designNotifier, required this.level});
  final DesignModel designNotifier;
  final GameLevel level;
  @override
  State<StatefulWidget> createState() => _Level1Page(designNotifier);
}

class _Level1Page extends State<Level1Page>{
  _Level1Page(this.designNotifier);
  final DesignModel designNotifier;
  static final _log = Logger('PlaySessionScreen');

  static const _celebrationDuration = Duration(milliseconds: 500);

  static const _preCelebrationDuration = Duration(milliseconds: 100);
  
  late bool butterliesUpdated = false;
  bool _duringCelebration = false;
  late LevelState levelState = LevelState(onWin: _playerWon,
   onLose: _playerLost, 
   goal: widget.level.difficulty);

  late DateTime _startOfPlay;
  late final playerProgress = context.read<PlayerProgress>();

  @override
  void initState() {
    super.initState();

    _startOfPlay = DateTime.now();
  }

  showButterflyDialog(){
      helpers.openCustomDialog(context, "Hurray!!!", "You've unlocked butterflies", Colors.green);
  }


  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    // final helpers = Helpers();
    final currentLevelState = context.read<DesignModel>();

   return MultiProvider(
      providers: [
        Provider.value(value: widget.level),
        // Create and provide the [LevelState] object that will be used
        // by widgets below this one in the widget tree.
        ChangeNotifierProvider(
          create: (context) => LevelState(
            goal: widget.level.difficulty,
            onWin: _playerWon,
            onLose: _playerLost
          ),
        ),
      ],
      child: IgnorePointer( 
        ignoring: _duringCelebration,
        child: Scaffold( 
          appBar: AppBar( 
            title: Text(
              'Level: ${currentLevelState.level.number} (Drag and drop flowers on the soil)',
              style:
                  const TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
            ),
          ), 
          body: ListenableBuilder(
                listenable: designNotifier,
                builder: (context,  widget) {
                  
                  levelState.setProgress(designNotifier.totalpoints.round());
                  levelState.evaluate();
                  
  
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) { 
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight,
                          maxWidth: constraints.maxWidth,
                          minHeight: constraints.minHeight,
                          minWidth: constraints.maxWidth
                        ),
                        child:  DragGesturePage(designNotifier: designNotifier,),
                      );
                    },
                  );
              
              },
            ),

          
          floatingActionButton: Container(
            height: 30,
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(153, 33, 149, 243),
              boxShadow: const [
                  BoxShadow(color: Color.fromARGB(153, 220, 231, 59), spreadRadius: 3),
              ],
            ),

            child: ListenableBuilder(
            listenable: designNotifier,
            builder: (context, widget){
              return Text(
                "Score: ${designNotifier.totalpoints}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
              );
            },
          ),
          ),
           bottomSheet: Container(
            height: 50,
            width: 200,
            padding: const EdgeInsets.all(10),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: palette.backgroundMain,
              boxShadow: [
                  BoxShadow(color: palette.backgroundMain, spreadRadius: 3),
              ],
            ),
            child: ListenableBuilder(
            listenable: designNotifier,
            builder: (context, widget){
              return Flex(
                direction: Axis.horizontal,
                children: [
                  Text(
                    designNotifier.hintText,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white
                    ),
                  ),
                  
                ],
              );
            },
          ),
          ),
        )
      )
   );

  }

  static const _gap = SizedBox(height: 10);

   Future<void> _playerLost() async {
    _log.info('Level ${widget.level.number} failed');

    final score = Score(
      widget.level.number,
      widget.level.difficulty,
      DateTime.now().difference(_startOfPlay),
      levelState.progress,
    );

    // final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(widget.level.number - 1);

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
    _log.info('Level ${widget.level.number} won');
   final score = Score(
      widget.level.number,
      widget.level.difficulty,
      DateTime.now().difference(_startOfPlay),
      levelState.progress,
    );

    // final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(widget.level.number);
    print("highest progress: ${playerProgress.highestLevelReached}");

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

    GoRouter.of(context).go('/play/won', extra: {'score': score});
  }
}
