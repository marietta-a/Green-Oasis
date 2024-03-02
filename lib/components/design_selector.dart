
import 'dart:async';

import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/components/design_selectors.dart';
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/settings/settings.dart';
import 'package:green_oasis/style/my_button.dart';
import 'package:green_oasis/style/palette.dart';
import 'package:green_oasis/style/responsive_screen.dart';
import 'package:provider/provider.dart';

class Designer extends StatelessWidget{
  const Designer({super.key});

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
                  'Select Designs',
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
                              minWidth: viewportConstraints.maxWidth
                            ),
                            child: Flex(
                              // mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              direction: Axis.horizontal,
                            
                              children: <Widget>[
                                Container(
                                  // A fixed-height child.
                                  color: helpers.cardColor, // Yellow
                                  height: viewportConstraints.minHeight,
                                  alignment: Alignment.center,
                                  child: HouseDesigner(
                                    onTap: () {  }
                                  )
                                ),
                                Container(
                                  // Another fixed-height child.
                                  color: helpers.cardColor, // Green
                                  height: viewportConstraints.minHeight,
                                  alignment: Alignment.center,
                                  child: PlantDesigner()
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