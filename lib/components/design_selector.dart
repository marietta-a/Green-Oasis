
import 'dart:async';

import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/components/design_selectors.dart';
import 'package:green_oasis/components/designer.dart';
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/level_selection/levels.dart';
import 'package:green_oasis/pages/drag/drag_gesture_page.dart';
import 'package:green_oasis/settings/settings.dart';
import 'package:green_oasis/style/my_button.dart';
import 'package:green_oasis/style/palette.dart';
import 'package:green_oasis/style/responsive_screen.dart';
import 'package:provider/provider.dart';

class DesignSelector extends StatefulWidget{
  DesignSelector({super.key, required this.designNotifier});
  final DesignModel designNotifier;
  @override
  State<StatefulWidget> createState() => _DesignSelector(designNotifier);
}

class _DesignSelector extends State<DesignSelector>{
  _DesignSelector(this.designNotifier);
  final DesignModel designNotifier;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    final helpers = Helpers();
    var points = designNotifier.points;

    return Scaffold(
        backgroundColor: palette.backgroundLevelSelection,
        body: ResponsiveScreen(
          squarishMainArea: Column(
            children: [
               Padding(
                padding: const EdgeInsets.all(6),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                            'To create your garden, drag and drop flowers on the soil. You earn points from planting flowers',
                            style:
                                TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
                          ),
                      Text(
                        'Score $points',
                        style: const TextStyle(
                           backgroundColor: Colors.blue,
                           color: Colors.white,
                           fontSize: 24
                          ),
                      )
                    ],
                  )
                ),
              ),
              Expanded(
                child: ListenableBuilder(
                        listenable: designNotifier,
                        builder: (context,  widget) {
                        
                        const levelNumber = 1;
                        final level =  gameLevels.singleWhere((e) => e.number == levelNumber);

                          return   DragGesturePage(designNotifier: designNotifier,);
                  }
                )
             ),
            ]
          ),
          rectangularMenuArea: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(
                onPressed: () {
                  GoRouter.of(context).go('/designer');
                },
                child: const Text('Start Design'),
              ),
              _gap,
              MyButton(
                onPressed: () => GoRouter.of(context).go('/'),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      );
    
    }

  static const _gap = SizedBox(height: 10);
}

class Design{
  Widget widget;
  final ItemType itemType;
  final String src;

  Design(this.src, {required this.itemType, required this.widget});
}