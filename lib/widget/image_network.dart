import 'package:flutter/material.dart';

// TODO 4

class ImageNetwork extends StatelessWidget {
  final String src;
  final String? title;
  final double? size;

  const ImageNetwork(
    this.src, {
    Key? key,
    this.title,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      loadingBuilder: (
        BuildContext context,
        Widget widget,
        ImageChunkEvent? event,
      ) {
        return (event != null) ? _noImage() : widget;
      },
      errorBuilder: (
        BuildContext context,
        Object exception,
        StackTrace? stackTrace,
      ) {
        return _noImage();
      },
      width: size,
      height: size,
    );
  }

  Widget _noImage() {
    return Tooltip(
      message: title ?? src,
      child: Container(
        alignment: Alignment.center,
        width: size,
        height: size,
        child: Icon(
          Icons.broken_image,
          size: size,
        ),
      ),
    );
  }
}
