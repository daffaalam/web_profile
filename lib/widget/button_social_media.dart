import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/personal_data.dart';
import 'image_network.dart';

// TODO 5

class ButtonSocialMedia extends StatelessWidget {
  final EdgeInsets padding;
  final List<SocialMedia> socialMedia;

  ButtonSocialMedia({
    this.padding = const EdgeInsets.all(0.0),
    this.socialMedia = const <SocialMedia>[],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List<Widget>.generate(
          this.socialMedia.length,
          (int index) {
            return InkWell(
              child: ImageNetwork(
                this.socialMedia[index].image,
                title: this.socialMedia[index].title,
                size: IconThemeData.fallback().size * 1.5,
              ),
              onTap: () async {
                bool _canLaunch = await canLaunch(this.socialMedia[index].url);
                if (_canLaunch) await launch(this.socialMedia[index].url);
              },
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            );
          },
        ),
      ),
    );
  }
}
