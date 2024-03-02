
import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';


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
