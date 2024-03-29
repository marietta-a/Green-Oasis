// Copyright 2023, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/game_levels/level1_page.dart';
import 'package:green_oasis/game_levels/level2_page.dart';
import 'package:green_oasis/game_levels/level3_page.dart';
import 'package:green_oasis/lost_game/lose_game_screen.dart';
import 'package:provider/provider.dart';

import 'game_internals/score.dart';
import 'level_selection/level_selection_screen.dart';
import 'level_selection/levels.dart';
import 'main_menu/main_menu_screen.dart';
import 'settings/settings_screen.dart';
import 'style/my_transition.dart';
import 'style/palette.dart';
import 'win_game/win_game_screen.dart';

/// The router describes the game's navigational hierarchy, from the main
/// screen through settings screens all the way to each individual level.
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenuScreen(key: Key('main menu')),
      routes: [
        GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
                  key: const ValueKey('play'),
                  color: context.watch<Palette>().backgroundLevelSelection,
                  child: const LevelSelectionScreen(
                    key: Key('level selection'),
                  ),
                ),
            routes: [
              GoRoute(
                path: 'session/:level',
                pageBuilder: (context, state) {
                  final designNotifier = DesignModel();
                  final levelNumber = int.parse(state.pathParameters['level']!);
                  final level =
                      gameLevels.singleWhere((e) => e.number == levelNumber);
                  return buildMyTransition<void>(
                    key: const ValueKey('level'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    // child: PlaySessionScreen(
                    //   level,
                    //   key: const Key('play session'),
                    // ),
                    
                    child: levelNumber == 1 ?
                           Level1Page(
                      designNotifier: designNotifier,
                      key:  Key('play game $levelNumber'),
                      level: level,) :
                      (levelNumber == 2 ? Level2Page(
                      designNotifier: designNotifier,
                      key:  Key('play game $levelNumber'),
                      level: level,) : Level3Page(
                      designNotifier: designNotifier,
                      key: Key('play game $levelNumber'),
                      level: level,) ),
                  );
                },
              ),
              GoRoute(
                path: 'won',
                redirect: (context, state) {
                  if (state.extra == null) {
                    // Trying to navigate to a win screen without any data.
                    // Possibly by using the browser's back button.
                    return '/';
                  }

                  // Otherwise, do not redirect.
                  return null;
                },
                pageBuilder: (context, state) {
                  final map = state.extra! as Map<String, dynamic>;
                  final score = map['score'] as Score;

                  return buildMyTransition<void>(
                    key: const ValueKey('won'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    child: WinGameScreen(
                      score: score,
                      key: const Key('win game'),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'lost',
                redirect: (context, state) {
                  if (state.extra == null) {
                    // Trying to navigate to a win screen without any data.
                    // Possibly by using the browser's back button.
                    return '/';
                  }

                  // Otherwise, do not redirect.
                  return null;
                },
                pageBuilder: (context, state) {
                  final map = state.extra! as Map<String, dynamic>;
                  final score = map['score'] as Score;

                  return buildMyTransition<void>(
                    key: const ValueKey('lost'),
                    color: context.watch<Palette>().backgroundPlaySession,
                    child: LoseGameScreen(
                      score: score,
                      key: const Key('lost game'),
                    ),
                  );
                },
              )
            ]),
        GoRoute(
          path: 'settings',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        ),
        // GoRoute(
        //   path: 'design-selector',
        //   builder: (context, state){
        //      final designNotifier = DesignModel();
        //      return   DesignSelector(key: const Key('design selector'), 
        //      designNotifier: designNotifier);
        //   }
        // ),
        
        // GoRoute(
        //   path: 'designer/:level',
        //   pageBuilder: (context, state) {
        //     final levelNumber = int.parse(state.pathParameters['level']!);
        //     final level =
        //         gameLevels.singleWhere((e) => e.number == levelNumber);
        //     return buildMyTransition<void>(
        //       key: ValueKey('level'),
        //       color: context.watch<Palette>().backgroundPlaySession,
        //       child: PlaySessionScreen(
        //         level,
        //         key: const Key('play session'),
        //       ),
        //     );
        //   },
        // ),
        // GoRoute(
        //   path: 'play/designer/:level',
        //   pageBuilder: (context, state) {
        //      final designNotifier = DesignModel();
        //     // final levelNumber = int.parse(state.pathParameters['level']!);
        //     const levelNumber = 1;
        //     final level =
        //         gameLevels.singleWhere((e) => e.number == levelNumber);
        //     return buildMyTransition<void>(
        //       key: const ValueKey('level'),
        //       color: context.watch<Palette>().backgroundPlaySession,
        //       child: DesignSelector(designNotifier: designNotifier,key: const Key('play session'))
        //       // child: Designer(
        //       //   designNotifier: designNotifier,
        //       //   level: level,
        //       //   key: const Key('play session'),
        //       // ),
        //     );
        //   },
        // ),
      ],
    ),
  ],
);
