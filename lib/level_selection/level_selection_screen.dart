// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/components/core.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';
import 'levels.dart';


class LevelSelectionScreen extends StatefulWidget{
  const LevelSelectionScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LevelSelectionScreen();

}

class _LevelSelectionScreen extends State<LevelSelectionScreen> {
  _LevelSelectionScreen();

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();
    final designNotifier = context.watch<DesignModel>();
    final textStyle = TextStyle(
          fontSize: 28,
          color: Colors.white
    );
    final textStyleDisabled = TextStyle(
          fontSize: 28,
          color: Colors.grey
    );
    final enabled = (int levelNumber){
        return playerProgress.highestLevelReached >= levelNumber - 1;
    };

    return Scaffold(
      // backgroundColor: palette.backgroundLevelSelection,
      backgroundColor: const Color.fromARGB(255, 46, 73, 47),
      body: ResponsiveScreen(
          squarishMainArea: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Select level',
                    style:
                        TextStyle(
                          fontFamily: 'Permanent Marker', fontSize: 32,
                          color: Colors.white
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: LayoutBuilder(
                        builder: (context, constraints){
                          return ListView(
                            children: [
                              for (final level in gameLevels)
                                ListTile(
                                  enabled: playerProgress.highestLevelReached >=
                                      level.number - 1,
                                  onTap: () {
                                    final audioController = context.read<AudioController>();
                                    audioController.playSfx(SfxType.buttonTap);
                                    designNotifier.setGameLevel(level);
                                    
                                    GoRouter.of(context)
                                        .go('/play/session/${level.number}');
                                    // if(level.number == 1){
                                    //   GoRouter.of(context)
                                    //     .go('play/designer/${level.number}');
                                    // }
                                    // else{
                                    //  GoRouter.of(context)
                                    //     .go('/play/session/${level.number}');
                                    // }
                                  },
                                  leading: Text(level.number.toString(), style: enabled(level.number) ? textStyle : textStyleDisabled,),
                                  title: Text('Level #${level.number}', style: enabled(level.number) ? textStyle : textStyleDisabled,),
                                )
                            ],
                          );
                        }
                      )
              ),
            ],
          ),
          rectangularMenuArea: MyButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Back'),
          ),
        )
      );
  }
}
