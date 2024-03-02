import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/designs.dart';
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/helpers/helpers.dart';


class PlantDesigner extends StatelessWidget{

  final widgets = [
    const Plant(),
    // const Plant1(),
    const Plant2(),
    const Plant3(),
    const Plant4(),
    const Plant5(),
  ];

  
  @override
  Widget build(BuildContext context) {
        // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for(final item in widgets)
            ListTile(
              // A fixed-height child. // Yellow
              // color: const Color(0xffeeee00),
              // height: helpers.itemSize.y,
              // alignment: Alignment.center,
              leading: item,
            ),
        ],
      ),
      // The custom button
      // child: Container(
      //   padding: const EdgeInsets.all(12),
      //   decoration: BoxDecoration(
      //     color: Colors.lightBlue,
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: <Widget>[
      //             for(final item in widgets)
      //               Container(
      //                 // A fixed-height child. // Yellow
      //                 color: const Color(0xffeeee00),
      //                 height: helpers.itemSize.y,
      //                 alignment: Alignment.center,
      //                 child: item,
      //               ),
      //           ],
      //         ),
      // ),
    );

  }
}

final helpers = Helpers();

class Plant extends StatelessWidget{
    const Plant({super.key});
    static const String src = "assets/images/plant.png";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
}

class Plant1 extends StatelessWidget{
    const Plant1({super.key});
    static const String src = "assets/images/plant1.webp";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
}

class Plant2 extends StatelessWidget{
    const Plant2({super.key});
    static const String src = "assets/images/plant2.webp";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
}
   

class Plant3 extends StatelessWidget{
    const Plant3({super.key});
    static const String src = "assets/images/plant3.png";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
}


class Plant4 extends StatelessWidget{
    const Plant4({super.key});
    static const String src = "assets/images/plant4.jpg";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
}


class Plant5 extends StatelessWidget{
    const Plant5({super.key});
    static const String src = "assets/images/plant5.png";

    @override
    Widget build(BuildContext context) {
      return Container(
        key: super.key,
        color: helpers.cardColor,
        child: const Image(image: AssetImage(src)),
        
      );
    }
    
}
