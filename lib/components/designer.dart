import 'package:flutter/material.dart';
import 'package:green_oasis/components/design_selectors.dart';

class Designer extends StatefulWidget{
  const Designer({super.key});
  @override
  State<StatefulWidget> createState() => _Designer();
  
}

class _Designer extends State<Designer> {
  _Designer();

  // final String name;
  // final String location;

  

  @override
  Widget build(BuildContext context) {

    final plantLen = PlantDesigner.activeElements.length;
    final halfLen = int.parse((plantLen/2).toString());
    

    return Align(
      alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
                /*1*/
              for(var i = 0 ; i < plantLen/2 ; i ++)
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: PlantDesigner.activeElements[i],
                    )
              ),

              for(final item in HouseDesigner.activeElements)
                SizedBox(
                    height: 400,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: item,
                    )
                )
                ,
              for(var i = halfLen ; i < plantLen ; i ++)
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: PlantDesigner.activeElements[i],
                    )
              ),
              /*3*/
              // Icon(
              //   Icons.star,
              //   color: Colors.red[500],
              // ),
              // const Text('41'),
            ],
          ),
      )
    );
  }
}