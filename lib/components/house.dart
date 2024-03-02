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
import 'package:green_oasis/components/garden.dart';
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

const helpers = Helpers();
class HouseDesigner extends StatelessWidget{
  
  HouseDesigner({super.key});

  final widgets = <Widget> [
     const House(),
     const House1(),
     const House2(),
  ];


  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Green Oasis',
    //   home: GameWidget(game: Houses()),
      
    // );
     final helpers =  Helpers();

     return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                minWidth: helpers.screenSize.x
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for(final item in widgets)
                    Container(
                      // A fixed-height child. // Yellow
                      color: const Color(0xffeeee00),
                      height: helpers.itemSize.y,
                      alignment: Alignment.center,
                      child: item,
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

// class House extends SpriteComponent with DragCallbacks{
//   static String src = "house.png";
//   House() : super(size: helpers.houseSize);
//   //  House() : super(size: helpers.houseSize, position: helpers.houseSize);

//    @override
//    Future<void> onLoad() async {
//       sprite = await Sprite.load(src);
//   }

//   // @override
//   // bool debugMode = true;


//   @override
//   void update(double dt) {
//     super.update(dt);
//     debugColor = isDragged ? Colors.greenAccent : Colors.purple;
//   }

//   @override
//   void onDragUpdate(DragUpdateEvent event) {
//     position += event.localDelta;
//   }
// }

  class House extends StatelessWidget{
    const House({super.key});
    static const String src = "assets/images/house.png";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
  }

  class House1 extends StatelessWidget{
    const House1({super.key});
    static const String src = "assets/images/house1.webp";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
  }
class House2 extends StatelessWidget{
  const House2({super.key});
  static const String src = "assets/images/house2.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      key: super.key,
      color: helpers.cardColor,
      child: const Image(image: AssetImage(src)),
       
    );
  }
  
}