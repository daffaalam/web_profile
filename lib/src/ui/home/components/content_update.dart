import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import '../../../model/personal_data.dart';
import '../../../widget/widget_content.dart';

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
          onTap: () {
            Utils.urlLaunchString(data.source);
          },
          hoverColor: Colors.transparent,
        ),
      ],
    );
  }
}
