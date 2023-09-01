// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final Future<String?> imageUrlFuture;
  int width, height;

  ImageWidget({Key? key, required this.imageUrlFuture, this.width = 50, this.height = 50}) : super(key: key);

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
          ? Image.network(
              _imageUrl as String,
              fit: BoxFit.cover,
              cacheHeight: widget.height,
              cacheWidth: widget.width,
            )
          : const CircularProgressIndicator(),
    );
  }
}