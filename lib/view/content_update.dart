import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/personal_data.dart';
import '../widget/widget_content.dart';

class ContentUpdate extends StatelessWidget {
  const ContentUpdate(this.data, {Key? key}) : super(key: key);

  final PersonalData data;

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      children: <Widget>[
        ListTile(
          title: Text(
            'Last Update : ${data.lastUpdate}',
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            '\n${data.source}',
            textAlign: TextAlign.center,
          ),
          isThreeLine: true,
          onTap: () async {
            bool _canLaunch = await canLaunch(data.source);
            if (_canLaunch) await launch(data.source);
          },
          hoverColor: Colors.transparent,
        ),
      ],
    );
  }
}
