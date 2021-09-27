import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/personal_data.dart';
import 'image_network.dart';

// TODO 5

class ButtonSocialMedia extends StatelessWidget {
  final EdgeInsets padding;
  final WrapAlignment alignment;
  final double spacing;
  final double? runSpacing;
  final List<SocialMedia> socialMedia;
  final IconThemeData _themeData = const IconThemeData.fallback();

  const ButtonSocialMedia({
    Key? key,
    this.padding = const EdgeInsets.all(0.0),
    this.alignment = WrapAlignment.center,
    this.spacing = 32.0,
    this.runSpacing,
    this.socialMedia = const <SocialMedia>[],
  }) : super(key: key);

  Widget _button(int index) {
    return InkWell(
      child: ImageNetwork(
        socialMedia[index].image,
        title: socialMedia[index].title,
        size: _themeData.size,
      ),
      onTap: () async {
        bool _canLaunch = await canLaunch(socialMedia[index].url);
        if (_canLaunch) await launch(socialMedia[index].url);
      },
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
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
