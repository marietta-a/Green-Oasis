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
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/player_progress/player_progress.dart';
import 'package:green_oasis/style/my_button.dart';
import 'package:green_oasis/style/palette.dart';
import 'package:green_oasis/style/responsive_screen.dart';
import 'package:provider/provider.dart';

class Plants extends FlameGame{
    Plants();
  late double zoom = 20;

  final designs = [
      Design(
        imageSrc: Plant.src,
        itemType: ItemType.plant,
        item: Plant().sprite!
      ),
      Design(
        imageSrc: Plant1.src,
        itemType: ItemType.plant,
        item: Plant().sprite!
      ),
      Design(
        imageSrc: Plant2.src,
        itemType: ItemType.plant,
        item: Plant().sprite!
      ),
      Design(
        imageSrc: Flower.src,
        itemType: ItemType.plant,
        item: Plant().sprite!
      ),
  ];

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewport = FixedResolutionViewport(resolution: helpers.screenSize/2);
    add(Plant());
    add(Plant1());
    add(Plant2());
    add(Flower());
  }


  // @override
  // Widget build(BuildContext context) {
  //   final palette = context.watch<Palette>();
  //   final playerProgress = context.watch<PlayerProgress>();

  //     return Scaffold(
  //     backgroundColor: palette.backgroundLevelSelection,
  //     body: ResponsiveScreen(
  //       squarishMainArea: Column(
  //         children: [
  //           const Padding(
  //             padding: EdgeInsets.all(16),
  //             child: Center(
  //               child: Text(
  //                 'Select Plant Design',
  //                 style:
  //                     TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 50),
  //           Expanded(
  //             child: Column(
  //               children: [
  //                 for (final item in designs)
  //                   ImageWidget(imageSrc: item.imageSrc)
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //       rectangularMenuArea: MyButton(
  //         onPressed: () {
  //           GoRouter.of(context).go('/');
  //         },
  //         child: const Text('Back'),
  //       ),
  //     ),
  //   );

  //   // return Scaffold(
  //   //   backgroundColor: palette.backgroundLevelSelection,
  //   //   body: ResponsiveScreen(
  //   //     squarishMainArea: Column(
  //   //       children: [
  //   //         const Padding(
  //   //           padding: EdgeInsets.all(16),
  //   //           child: Center(
  //   //             child: Text(
  //   //               'Select level',
  //   //               style:
  //   //                   TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
  //   //             ),
  //   //           ),
  //   //         ),
  //   //         // const SizedBox(height: 50)
  //   //       ],
  //   //     ), 
  //   //     rectangularMenuArea: Column(
  //   //     mainAxisAlignment: MainAxisAlignment.end,
  //   //     children:[
  //   //             for (final item in designs)
  //   //               ImageWidget(
  //   //                   imageSrc: item.imageSrc,
  //   //                   onPressed: () => {
  //   //                     item.isSelected = true
  //   //                   },
  //   //               )
  //   //           ],
  //   //     ),
  //   //   )
  //   // );
  // }

}

class PlantDesigner extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plants',
      home: GameWidget(game: Plants()),
      
    );
  }
}

final helpers = Helpers();

class Plant extends SpriteComponent with DragCallbacks{
   Plant(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "plant.png";

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load(src);
    spriteImage = Sprite(await Flame.images.load(src));
    final boxSize = Vector2.all(300);
    final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
    add(
      nineTileBoxComponent = NineTileBoxComponent(
        nineTileBox: nineTileBox,
        position: size / 2,
        size: boxSize,
        anchor: Anchor.center,
      ),
    );
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

class Plant1 extends SpriteComponent with DragCallbacks{
   Plant1(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "plant1.png";

   @override
   Future<void> onLoad() async {
      sprite = await Sprite.load(src);
      spriteImage = Sprite(await Flame.images.load(src));
      final boxSize = Vector2.all(300);
      final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
      add(
        nineTileBoxComponent = NineTileBoxComponent(
          nineTileBox: nineTileBox,
          position: size / 2,
          size: boxSize,
          anchor: Anchor.center,
        ),
      );
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

class Plant2 extends SpriteComponent with DragCallbacks{
   Plant2(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "plant2.png";

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load(src);
      spriteImage = Sprite(await Flame.images.load(src));
      final boxSize = Vector2.all(300);
      final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
      add(
        nineTileBoxComponent = NineTileBoxComponent(
          nineTileBox: nineTileBox,
          position: size / 2,
          size: boxSize,
          anchor: Anchor.center,
        ),
      );
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

class Flower extends SpriteComponent with DragCallbacks{
   Flower(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower.jpg";

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load(src);
      spriteImage = Sprite(await Flame.images.load(src));
      final boxSize = Vector2.all(300);
      final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
      add(
        nineTileBoxComponent = NineTileBoxComponent(
          nineTileBox: nineTileBox,
          position: size / 2,
          size: boxSize,
          anchor: Anchor.center,
        ),
      );
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


class Flower1 extends SpriteComponent with DragCallbacks{
   Flower1(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower1.jpg";

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load(src);
      spriteImage = Sprite(await Flame.images.load(src));
      final boxSize = Vector2.all(300);
      final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
      add(
        nineTileBoxComponent = NineTileBoxComponent(
          nineTileBox: nineTileBox,
          position: size / 2,
          size: boxSize,
          anchor: Anchor.center,
        ),
      );
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


class Flower2 extends SpriteComponent with DragCallbacks{
   Flower2(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower2.jpg";

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load(src);
      spriteImage = Sprite(await Flame.images.load(src));
      final boxSize = Vector2.all(300);
      final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
      add(
        nineTileBoxComponent = NineTileBoxComponent(
          nineTileBox: nineTileBox,
          position: size / 2,
          size: boxSize,
          anchor: Anchor.center,
        ),
      );
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


class Flower3 extends SpriteComponent with DragCallbacks{
   Flower3(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower3.jpg";

   @override
   Future<void> onLoad() async {
       sprite = await Sprite.load(src);
      spriteImage = Sprite(await Flame.images.load(src));
      final boxSize = Vector2.all(300);
      final nineTileBox = NineTileBox(spriteImage, destTileSize: 148);
      add(
        nineTileBoxComponent = NineTileBoxComponent(
          nineTileBox: nineTileBox,
          position: size / 2,
          size: boxSize,
          anchor: Anchor.center,
        ),
      );
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


class Flower4 extends SpriteComponent with DragCallbacks{
   Flower4(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower4.jpg";

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


class Flower5 extends SpriteComponent with DragCallbacks{
   Flower5(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower5.jpg";

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


class Flower6 extends SpriteComponent with DragCallbacks{
   Flower6(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower6.jpg";

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


class Flower7 extends SpriteComponent with DragCallbacks{
   Flower7(): super(size: helpers.plantSize, position: helpers.plantPosition);
  late NineTileBoxComponent nineTileBoxComponent;
  late Sprite spriteImage;
  static String src = "flower7.jpg";

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