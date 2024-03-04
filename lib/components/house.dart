// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';
const helpers = Helpers();

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
       // color: helpers.cardColor,
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
       // color: helpers.cardColor,
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
     // color: helpers.cardColor,
      child: const Image(image: AssetImage(src)),
       
    );
  }
  
}