// ignore_for_file: library_private_types_in_public_api, file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final Future<String?> imageUrlFuture;

  const ImageWidget({super.key, required this.imageUrlFuture});

  @override
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
    return Positioned(
      top: 150,
      right: 0,
      child: _imageUrl != null
          ? Image.network(
              _imageUrl as String,
              fit: BoxFit.cover,
              cacheHeight: (284*0.85).toInt(),
              cacheWidth: (399*0.85).toInt(),
              scale: 1.0,
            )
          : const CircularProgressIndicator(),
    );
  }
}
