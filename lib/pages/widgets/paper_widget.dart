import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/shared/util/common_image_widgets.dart';

class PaperWidget extends StatelessWidget{
  // DesignModel designNotifier;
  double? top;
  double? bottom;
  double? right;
  double? left;
  VoidCallback? onTap;

  PaperWidget({this.top, this.bottom, this.right, this.left, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: (){
          onTap?.call();
          print(onTap?.toString());
        },
        child:  CommonImageWidgets.PaperImage,
      )
    );
  }
  
}