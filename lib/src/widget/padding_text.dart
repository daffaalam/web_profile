import 'package:flutter/material.dart';

class PaddingText extends StatelessWidget {
  const PaddingText(
    this.data, {
    Key? key,
    this.padding = const EdgeInsets.all(8.0),
    this.style,
    this.textAlign,
  }) : super(key: key);

  final String data;
  final EdgeInsetsGeometry padding;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
