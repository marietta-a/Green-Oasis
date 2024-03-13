
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String imageSrc;

  const ImageWidget({super.key, required this.imageSrc});
  @override
  ImageWidgetState createState() => ImageWidgetState(imageSrc: imageSrc);
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