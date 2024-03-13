// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/level_selection/levels.dart';
import 'package:green_oasis/player_progress/player_progress.dart';
import 'package:provider/provider.dart';

import '../game_internals/score.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class WinGameScreen extends StatelessWidget {
  final Score score;

  const WinGameScreen({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.read<PlayerProgress>();
    final designNotifier = context.watch<DesignModel>();
    final designModel = context.read<DesignModel>();

    const gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      // backgroundColor: palette.backgroundPlaySession,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            gap,
            const Center(
              child: Text(
                'You won!',
                style: TextStyle(
                  fontFamily: 'Permanent Marker', 
                  fontSize: 50,
                  color: Colors.white
                ),
              ),
            ),
            gap,
            Center(
              child: Text(
                'Score: ${score.score}\n'
                'Time: ${score.formattedTime}',
                style: const TextStyle(
                    fontFamily: 'Permanent Marker', 
                    fontSize: 20,
                    color: Colors.white
                  ),
              ),
            ),
          ],
        ),
        rectangularMenuArea:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              MyButton(
                onPressed: () {
                  GoRouter.of(context).go('/play');
                  final nextLevelNumber = designModel.level.number + 1;
                  if(nextLevelNumber <= gameLevels.length){
                    final level = gameLevels[designModel.level.number];
                    designNotifier.setGameLevel(level);
                    GoRouter.of(context).go('/play/session/$nextLevelNumber');
                  }
                  else{
                    GoRouter.of(context).go('/play');
                  }
                  // GoRouter.of(context).go('/play');
                },
                child: const Text('Continue'),
              ),
              _gap,
              MyButton(
                onPressed: () {
                  // GoRouter.of(context).go('/play');
                  GoRouter.of(context).go('/');
                },
                child: const Text('Home'),
              ),
            ],
          ),
      ),
    );
  }

  
  static const _gap = SizedBox(height: 10);
}
