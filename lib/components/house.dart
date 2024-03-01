// ignore_for_file: must_be_immutable

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_oasis/audio/audio_controller.dart';
import 'package:green_oasis/audio/sounds.dart';
import 'package:green_oasis/components/Image_widget.dart';
import 'package:green_oasis/components/designs.dart';
import 'package:green_oasis/components/plant.dart';
import 'package:green_oasis/game.dart';
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/player_progress/player_progress.dart';
import 'package:green_oasis/settings/settings.dart';
import 'package:green_oasis/style/my_button.dart';
import 'package:green_oasis/style/palette.dart';
import 'package:green_oasis/style/responsive_screen.dart';
import 'package:provider/provider.dart';

final helpers = Helpers();

class Houses extends FlameGame{

  final designs = [
      Design(
        imageSrc: House.src,
        itemType: ItemType.house,
        item: House().sprite!
      ),
      Design(
        imageSrc: House1.src,
        itemType: ItemType.house,
        item: House().sprite!
      ),
      Design(
        imageSrc: House2.src,
        itemType: ItemType.house,
        item: House().sprite!
      ),
  ];

  
  late double zoom = 20;
  late Helpers helpers = Helpers();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewport = FixedResolutionViewport(resolution: helpers.screenSize/2);
    add(House());
    // add(House1());
    // add(House2());
    

  }

  // @override
  // Color backgroundColor() => const Color(0x00000000);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

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
            const SizedBox(height: 50),
            Expanded(
              child: Column(
                children: [
                  for (final item in designs)
                    ImageWidget(imageSrc: item.imageSrc)
                ],
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
    //   backgroundColor: palette.backgroundLevelSelection,
    //   body: ResponsiveScreen(
    //     squarishMainArea: Column(
    //       children: [
    //         const Padding(
    //           padding: EdgeInsets.all(16),
    //           child: Center(
    //             child: Text(
    //               'Select level',
    //               style:
    //                   TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
    //             ),
    //           ),
    //         ),
    //         // const SizedBox(height: 50)
    //       ],
    //     ), 
    //     rectangularMenuArea: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children:[
    //             for (final house in designs)
    //                ImageWidget(
    //                   imageSrc: house.imageSrc,
    //                   onPressed: () => {
    //                     house.isSelected = true
    //                   }
    //                )
    //           ],
    //     ),
    //   )
    // );
  }

}

class HouseDesigner extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Green Oasis',
    //   home: GameWidget(game: Houses()),
      
    // );

     return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
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
                    height: helpers.screenSize.y/2,
                    alignment: Alignment.center,
                    child: GameWidget(game: MyGame(zoom: 100)),
                  ),
                  Container(
                    // Another fixed-height child.
                    color: const Color(0xff008000), // Green
                    height: 120.0,
                    alignment: Alignment.center,
                    child: const Text('Fixed Height Content'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



class House extends SpriteComponent with DragCallbacks{
  static String src = "house.png";
  House() : super(size: helpers.houseSize);
  //  House() : super(size: helpers.houseSize, position: helpers.houseSize);

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load(src);
  }

  // @override
  // bool debugMode = true;


  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }
}

class House1 extends SpriteComponent with DragCallbacks{
   static String src = "house1.webp";
  //  House1() : super(size: helpers.houseSize, position: helpers.houseSize);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;

   @override
   Future<void> onLoad() async {
    sprite = await Sprite.load(src);
  }

  // @override
  // void onTap() {
  //   nineTileBoxComponent.scale.scale(1.2);
  // }

  // @override
  // void onDoubleTap() {
  //   nineTileBoxComponent.scale.scale(0.8);
  // }
  // @override
  // bool debugMode = true;


  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }
}

class House2 extends SpriteComponent with DragCallbacks{
   static String src = "house2.png";
  //  House2() : super(size: helpers.houseSize, position: helpers.houseSize);

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load(src);
  }
  // @override
  // bool debugMode = true;


  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? Colors.greenAccent : Colors.purple;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += event.localDelta;
  }
}