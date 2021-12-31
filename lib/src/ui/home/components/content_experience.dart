import 'package:flutter/material.dart';

import '../../../model/personal_data.dart';
import '../../../widget/widget_content.dart';

// TODO 8

class ContentExperience extends StatelessWidget {
  final List<Experience> experiences;

  const ContentExperience(this.experiences, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetContent(
      title: const Text(
        'My Experiences',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: List<Widget>.generate(
        experiences.length,
        (int index) {
          return ListTile(
            title: Text(
              '${experiences[index].title} '
              '(${experiences[index].period})',
            ),
            mouseCursor: MouseCursor.uncontrolled,
          );
        },
      ),
    );
  }
}
