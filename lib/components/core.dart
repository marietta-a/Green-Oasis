

import 'package:flutter/material.dart';
import 'package:green_oasis/helpers/helpers.dart';

class MyAnimatableElement extends StatefulWidget{
  
  final Widget child;
  final VoidCallback? onTap;
  final String src;

  const MyAnimatableElement({super.key, this.onTap, required this.src, required this.child});

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
