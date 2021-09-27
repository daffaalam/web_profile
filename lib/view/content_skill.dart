import 'package:flutter/material.dart';

import '../model/personal_data.dart';
import '../widget/widget_content.dart';

// TODO 9

class ContentSkill extends StatelessWidget {
  final List<Skill> skills;

  const ContentSkill(this.skills, {Key? key}) : super(key: key);

  List<Icon> _starRating(int rating) {
    rating = rating ~/ 10;
    return List<Icon>.generate(
      5,
      (int index) {
        int count = (index + 1) * 2;
        IconData iconData = Icons.star_border;
        if (count - rating == 1) {
          iconData = Icons.star_half;
        } else if (count - rating < 1) {
          iconData = Icons.star;
        }
        return Icon(
          iconData,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      title: const Text(
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
            title: Text(skills[index].title),
            trailing: Wrap(
              children: _starRating(skills[index].rating),
            ),
            onTap: () {},
            mouseCursor: MouseCursor.uncontrolled,
          );
        },
      ),
    );
  }
}
