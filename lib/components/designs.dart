
import 'dart:async';

import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/components/house.dart';
import 'package:green_oasis/components/plant.dart';
import 'package:green_oasis/game.dart';
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/settings/settings.dart';
import 'package:green_oasis/style/my_button.dart';
import 'package:green_oasis/style/palette.dart';
import 'package:green_oasis/style/responsive_screen.dart';
import 'package:provider/provider.dart';

class Designer extends StatelessWidget{
  Designer({super.key});

  
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTextStyle(
  //     style: Theme.of(context).textTheme.bodyMedium!,
  //     child: LayoutBuilder(
  //       builder: (BuildContext context, BoxConstraints viewportConstraints) {
  //         return SingleChildScrollView(
  //           child: ConstrainedBox(
  //             constraints: BoxConstraints(
  //               minHeight: viewportConstraints.maxHeight,
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: <Widget>[
  //                 Container(
  //                   // A fixed-height child.
  //                   color: const Color(0xffeeee00), // Yellow
  //                   height: 120.0,
  //                   alignment: Alignment.center,
  //                   child: HouseDesigner()
  //                 ),
  //                 Container(
  //                   // Another fixed-height child.
  //                   color: const Color(0xff008000), // Green
  //                   height: 120.0,
  //                   alignment: Alignment.center,
  //                   child: HouseDesigner()
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

      return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Select House Design',
                  style:
                      TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints viewportConstraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: viewportConstraints.maxHeight,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  // A fixed-height child.
                                  color: const Color(0xffeeee00), // Yellow
                                  height: 120.0,
                                  alignment: Alignment.center,
                                  child: HouseDesigner()
                                ),
                                Container(
                                  // Another fixed-height child.
                                  color: const Color(0xff008000), // Green
                                  height: 120.0,
                                  alignment: Alignment.center,
                                  child: HouseDesigner()
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).go('/');
          },
          child: const Text('Back'),
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: palette.backgroundMain,
    //   body: ResponsiveScreen(
    //     squarishMainArea: Center(
    //       child: Transform.rotate(
    //         angle: -0.1,
    //         child: const Text(
    //           "Let's build our conservative dream home!",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontFamily: 'Permanent Marker',
    //             fontSize: 55,
    //             height: 1,
    //           ),
    //         ),
    //       ),
    //     ),
    //     rectangularMenuArea: Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         HouseDesigner(),
    //         _gap,
    //          PlantDesigner(),
    //         _gap,
    //         Padding(
    //           padding: const EdgeInsets.only(top: 32),
    //           child: ValueListenableBuilder<bool>(
    //             valueListenable: settingsController.audioOn,
    //             builder: (context, audioOn, child) {
    //               return IconButton(
    //                 onPressed: () => settingsController.toggleAudioOn(),
    //                 icon: Icon(audioOn ? Icons.volume_up : Icons.volume_off),
    //               );
    //             },
    //           ),
    //         ),
    //         _gap,
    //         const Text('Music by Mr Smith'),
    //         _gap,
    //       ],
    //     ),
    //   ),
    // );
  }

  static const _gap = SizedBox(height: 10);
}

class Design{
  Sprite item;
  String imageSrc;
  late bool isSelected = false;
  final ItemType itemType;

  Design({required this.imageSrc, required this.itemType, required this.item});
}