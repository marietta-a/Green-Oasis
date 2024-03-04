
import 'package:flutter/material.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/components/design_selector.dart';
import 'package:green_oasis/components/house.dart';
import 'package:green_oasis/components/plant.dart';
import 'package:green_oasis/helpers/enums.dart';
import 'package:green_oasis/helpers/helpers.dart';

const helpers = Helpers();


class PlantDesigner extends StatefulWidget{
  const PlantDesigner({super.key});
  static List<MyAnimatableElement> activeElements = [];

  @override
  State<StatefulWidget> createState() => _PlantDesigner();
  
}
class _PlantDesigner extends State<PlantDesigner>{

  _PlantDesigner();

  final widgets = <MyAnimatableElement>[
    const MyAnimatableElement(
      src: Plant.src,
      child: Plant()
     ),
    const MyAnimatableElement(
      src: Plant2.src, 
      child: Plant2()
    ),
    // const MyAnimatableElement(
    //    src: Plant2.src,
    //    child: Plant2()
    // ),
    // const Plant4(),
    // const Plant5(),
  ];
  


  
  @override
  Widget build(BuildContext context) {
        // The GestureDetector wraps the button.
    
     return Flex(
       // mainAxisSize: MainAxisSize.min,
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
       direction: Axis.vertical,
       children: <Widget>[
         for(final item in widgets)
           Container(
             // A fixed-height child. // Yellow
             color: const Color(0xffeeee00),
             height: helpers.itemSize.y,
             alignment: Alignment.center,
             child: GestureDetector(
              child:  Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: item
                ),
                onTap: () {
                  PlantDesigner.activeElements.add(item);

                  const snackBar = SnackBar(content: Text('Tap'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
             ),
           ),
       ],
     );

  }
  
}

class HouseDesigner extends StatefulWidget{

  const HouseDesigner({super.key});

  static List<MyAnimatableElement> activeElements = [];
   
  @override
  State<StatefulWidget> createState() => _HouseDesigner();
  
}
class _HouseDesigner extends State<HouseDesigner>{
  
  _HouseDesigner();

  final widgets = <MyAnimatableElement> [
     const MyAnimatableElement(
      src: House.src, 
      child: House(),
    ),
     const MyAnimatableElement(
      src: House1.src, 
      child: House1(),
    ),
     const MyAnimatableElement(
      src: House2.src, 
      child: House2(),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Green Oasis',
    //   home: GameWidget(game: Houses()),
      
    // );
     return Flex(
       // mainAxisSize: MainAxisSize.min,
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
       direction: Axis.vertical,
       children: <Widget>[
         for(final item in widgets)
           Container(
             // A fixed-height child. // Yellow
             color: const Color(0xffeeee00),
             height: helpers.itemSize.y,
             alignment: Alignment.center,
             child: GestureDetector(
              child:  Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: item
                ),
                onTap: () {
                  HouseDesigner.activeElements.clear();
                  HouseDesigner.activeElements.add(item);

                  const snackBar = SnackBar(content: Text('Tap'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
             ),
           ),
       ],
     );
  }
}

