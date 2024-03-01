import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/components/plant.dart';
import 'package:green_oasis/helpers/helpers.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatefulWidget {
  final String imageSrc;

  const ImageWidget({super.key, required this.imageSrc});
  @override
  ImageWidgetState createState() => new ImageWidgetState(imageSrc: imageSrc);
}

class ImageWidgetState extends State<ImageWidget> {
  late dynamic sprite;
  final String imageSrc;

  ImageWidgetState({required this.imageSrc});

  @override
  initState() {
    super.initState();
    sprite = Image.asset(imageSrc);
  }

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(sprite: sprite,);
  }
}