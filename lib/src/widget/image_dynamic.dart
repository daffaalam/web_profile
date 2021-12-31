import 'package:flutter/material.dart';

// TODO 4

class ImageDynamic extends StatelessWidget {
  const ImageDynamic(
    this.src, {
    Key? key,
    this.title,
    this.size,
  }) : super(key: key);

  final String src;
  final String? title;
  final double? size;

  @override
  Widget build(BuildContext context) {
    Uri? uri = Uri.tryParse(src);
    return Image(
      image: uri?.isAbsolute ?? false ? _networkImage() : _assetImage(),
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

  ImageProvider _networkImage() {
    return NetworkImage(src);
  }

  ImageProvider _assetImage() {
    return AssetImage(src);
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
