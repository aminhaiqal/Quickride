// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quickride/src/utils/image_ratio.dart';

class ImageWidget extends StatefulWidget {
  final Future<String?> imageUrlFuture;
  double? width;
  double? aspectRatio;

  ImageWidget(
      {Key? key,
      required this.imageUrlFuture,
      this.width,
      this.aspectRatio})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    loadImageUrl();
  }

  void loadImageUrl() async {
    String? imageUrl = await widget.imageUrlFuture;
    setState(() {
      _imageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _imageUrl != null
          ? AspectRatioImage(
              imageUrl: _imageUrl as String,
              width: widget.width!,
              aspectRatio: widget.aspectRatio!,
            )
          : const CircularProgressIndicator(),
    );
  }
}
