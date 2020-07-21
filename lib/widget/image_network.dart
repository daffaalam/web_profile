import 'package:flutter/material.dart';

// TODO 4

class ImageNetwork extends StatelessWidget {
  final String src;
  final String title;
  final double size;

  ImageNetwork(
    this.src, {
    this.title,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      this.src,
      loadingBuilder: (
        BuildContext context,
        Widget widget,
        ImageChunkEvent event,
      ) {
        if (event != null) {
          return _noImage();
        } else {
          return widget;
        }
      },
      errorBuilder: (
        BuildContext context,
        Object exception,
        StackTrace stackTrace,
      ) {
        return _noImage();
      },
      width: this.size,
      height: this.size,
    );
  }

  Widget _noImage() {
    return Tooltip(
      message: this.title ?? this.src,
      child: Container(
        alignment: Alignment.center,
        width: this.size,
        height: this.size,
        child: Icon(
          Icons.broken_image,
          size: this.size,
        ),
      ),
    );
  }
}
