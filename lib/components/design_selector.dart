
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

      return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(6),
              child: Center(
                child: Text(
                  'Start Designing By Selecting your item',
                  style:
                      TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints viewportConstraints) {
                        
                      const levelNumber = 1;
                      final level =  gameLevels.singleWhere((e) => e.number == levelNumber);

                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: viewportConstraints.minHeight,
                              minWidth: viewportConstraints.minWidth
                            ),
                            child: Row(
                              children: [
                                Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  // direction: Axis.horizontal,
                                
                                  children: <Widget>[
                                    Container(
                                      // A fixed-height child.
                                      color: helpers.cardColor, // Yellow
                                      height: viewportConstraints.minHeight,
                                      alignment: Alignment.center,
                                      child: HouseDesigner(designNotifier: designNotifier)
                                    ),
                                    Container(
                                      // Another fixed-height child.
                                      color: helpers.cardColor, // Green
                                      height: viewportConstraints.minHeight,
                                      alignment: Alignment.center,
                                      child: PlantDesigner(designNotifier: designNotifier)
                                    ),
                                  ],
                                ),
                                Container(
                                  // direction: Axis.horizontal,
                                  child: Designer(designNotifier: designNotifier, level: level),
                                )
                              ],
                            )
                          ),
                        );
                      },
                    ),
            ),
          ],
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