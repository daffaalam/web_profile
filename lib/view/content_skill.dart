import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/personal_data.dart';
import '../widget/widget_content.dart';

// TODO 9

class ContentSkill extends StatelessWidget {
  final List<Skill> skills;

  ContentSkill(this.skills);

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      title: Text(
        "My Skills",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: List<Widget>.generate(
        skills.length,
        (int index) {
          return ListTile(
            title: Text(
              "${skills[index].title} (${skills[index].rating}%)",
            ),
            subtitle: LinearProgressIndicator(
              value: skills[index].rating / 100,
            ),
            mouseCursor: MouseCursor.uncontrolled,
          );
        },
      ),
    );
  }
}
