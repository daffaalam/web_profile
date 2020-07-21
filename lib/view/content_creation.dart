import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/personal_data.dart';
import '../widget/widget_content.dart';

// TODO 7

class ContentCreation extends StatelessWidget {
  final List<Creation> creations;

  ContentCreation(this.creations);

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      title: Text(
        "My Creations",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: List<Widget>.generate(
        creations.length,
        (int index) {
          return ListTile(
            title: Text(creations[index].title),
            trailing: Icon(Icons.open_in_new),
            onTap: () async {
              bool _canLaunch = await canLaunch(creations[index].url);
              if (_canLaunch) await launch(creations[index].url);
            },
          );
        },
      ),
    );
  }
}
