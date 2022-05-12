import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import '../../../model/personal_data.dart';
import '../../../widget/button_social_media.dart';
import '../../../widget/image_dynamic.dart';
import '../../../widget/padding_text.dart';
import '../../../widget/widget_content.dart';

class ContentAbout extends StatelessWidget {
  const ContentAbout(
    this.personalData, {
    Key? key,
    required this.orientation,
  }) : super(key: key);

  final PersonalData personalData;
  final Orientation orientation;

  double _maxSize(double maxSize, [double minSize = 128.0]) {
    return (maxSize > minSize) ? maxSize : minSize;
  }

  Widget _emailWidget() {
    return GestureDetector(
      child: PaddingText(
        personalData.email,
        textAlign: TextAlign.center,
      ),
      onTap: () {
        Uri url = Uri(
          scheme: 'mailto',
          path: personalData.email,
        );
        Utils.urlLaunch(url);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WidgetContent(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          constraints: BoxConstraints(
            maxWidth: _maxSize(size.height / 3),
            maxHeight: _maxSize(size.height / 3),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ImageDynamic(personalData.image),
        ),
        const SizedBox(
          height: 16.0,
        ),
        PaddingText(
          personalData.name,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        PaddingText(
          personalData.descSimple,
          style: const TextStyle(
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        PaddingText(
          personalData.descFull,
          textAlign: TextAlign.center,
        ),
        _emailWidget(),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Divider(),
        ),
        ButtonSocialMedia(
          padding: const EdgeInsets.all(16.0),
          socialMedia: personalData.socialMedia,
          size: orientation == Orientation.landscape ? 36.0 : 24.0,
        ),
      ],
    );
  }
}
