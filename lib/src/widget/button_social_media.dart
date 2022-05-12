import 'package:flutter/material.dart';
import 'package:web_profile/src/common/utils.dart';

import '../model/personal_data.dart';
import 'image_dynamic.dart';

class ButtonSocialMedia extends StatelessWidget {
  const ButtonSocialMedia({
    Key? key,
    this.padding = const EdgeInsets.all(0.0),
    this.alignment = WrapAlignment.center,
    this.spacing = 32.0,
    this.runSpacing,
    this.socialMedia = const <SocialMedia>[],
    this.size,
  }) : super(key: key);

  final EdgeInsets padding;
  final WrapAlignment alignment;
  final double spacing;
  final double? runSpacing;
  final List<SocialMedia> socialMedia;
  final double? size;
  final IconThemeData _themeData = const IconThemeData.fallback();

  Widget _button(int index) {
    return InkWell(
      onTap: () {
        Utils.urlLaunchString(socialMedia[index].url);
      },
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: ImageDynamic(
        socialMedia[index].image,
        title: socialMedia[index].title,
        size: size ?? _themeData.size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Wrap(
        alignment: alignment,
        spacing: spacing,
        runSpacing: runSpacing ?? (spacing / 2),
        children: List<Widget>.generate(
          socialMedia.length,
          (int index) => _button(index),
        ),
      ),
    );
  }
}
