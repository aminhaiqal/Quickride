import 'package:flutter/material.dart';

/*
  Ration:
  1:1 ration
  4:5 ration
  9:16 ration
  2:3 ration
  3:4 ration
*/

class AspectRatioImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double aspectRatio;

  const AspectRatioImage({
    required this.imageUrl,
    required this.width,
    required this.aspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = width / aspectRatio;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
