import 'package:flutter/material.dart';

import '../model/personal_data.dart';
import '../widget/button_social_media.dart';
import '../widget/image_network.dart';
import '../widget/widget_content.dart';

// TODO 6

class ContentAbout extends StatelessWidget {
  final PersonalData personalData;
  final double horizontalPadding;

  ContentAbout(
    this.personalData, {
    @required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            top: 8.0,
            right: horizontalPadding,
            bottom: 32.0,
          ),
          child: ClipOval(
            child: ImageNetwork(personalData.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            personalData.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            personalData.descSimple,
            style: TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            personalData.descFull,
            textAlign: TextAlign.center,
          ),
        ),
        ButtonSocialMedia(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          socialMedia: personalData.socialMedia,
        ),
      ],
    );
  }
}
