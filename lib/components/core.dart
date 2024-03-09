

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:green_oasis/level_selection/levels.dart';

class MyAnimatableElement extends StatefulWidget{
  
  final Widget child;
  final VoidCallback? onTap;
  final String src;
  final bool isArtifical;

  const MyAnimatableElement({super.key, this.onTap, required this.src, required this.isArtifical, required this.child});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState(){
    return _Element(src);
  }
  
}

class _Element extends State<MyAnimatableElement>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final String src;

  _Element(this.src);
  


  @override
  Widget build(BuildContext context) {
      
    return MouseRegion(
      onEnter: (event) {
        _controller.repeat();
      },
      onExit: (event) {
        _controller.stop(canceled: false);
      },
      child: RotationTransition(
        turns: _controller.drive(const MySineTween(0.005)),
        child: GestureDetector(
          onTap: widget.onTap,
          child: widget.child,
        ),
      ),
    );
  }
  
}



class DesignModel with ChangeNotifier {
   GameLevel level = gameLevels[1];
   List<MyAnimatableElement> plants = [];
   List<MyAnimatableElement> houses = [];
   double points = 0;
   double totalpoints = 0;
   bool pointsGained = false;
   List<GameDecoration> gameDecorationComponents = [];
   


  void setGameDecorationComponents(List<GameDecoration> components){
    gameDecorationComponents.addAll(components);
    notifyListeners();
  }

  void addGameDecorationComponent(GameDecoration component){
      gameDecorationComponents.add(component);
      notifyListeners();
  }

  void clearGameDecorationComponents(){
      gameDecorationComponents.clear();
      notifyListeners();
  }

  void setPointsGained(bool b){
      pointsGained = b;
      notifyListeners();
  }

  void setGameLevel(GameLevel level){
    this.level = level;
    notifyListeners();
  }

  void setPoints(double points){
     this.points = points;
     this.totalpoints += points;
     notifyListeners();
  }

  void clearPlants() {
    plants.clear();
    notifyListeners();
  }

  void removePlant(MyAnimatableElement plant) {
    plants.remove(plant);
    notifyListeners();
  }

  void addPlants(MyAnimatableElement plant) {
    plants.add(plant);
    notifyListeners();
  }



  void addHouses(MyAnimatableElement house) {
    houses.add(house);
    notifyListeners();
  }
  void clearHouses() {
    houses.clear();
    notifyListeners();
  }

  void removeHouse(MyAnimatableElement house) {
    houses.remove(house);
    notifyListeners();
  }
}
