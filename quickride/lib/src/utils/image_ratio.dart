import 'package:flutter/material.dart';

class AspectRatioImage extends StatelessWidget {
  final double aspectRatio;
  final String imageUrl;
  final double customWidth;

  const AspectRatioImage(
      {super.key,
      required this.aspectRatio,
      required this.imageUrl,
      required this.customWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: customWidth,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
