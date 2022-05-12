import 'package:flutter/material.dart';

import '../../../model/personal_data.dart';
import '../../../widget/stars_rating.dart';
import '../../../widget/widget_content.dart';

class ContentSkill extends StatelessWidget {
  final List<Skill> skills;

  const ContentSkill(this.skills, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      title: const Text(
        'My Skills',
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
            trailing: StarsRating(
              rating: skills[index].rating,
            ),
            onTap: () {},
            mouseCursor: MouseCursor.uncontrolled,
          );
        },
      ),
    );
  }
}
