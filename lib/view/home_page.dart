import 'package:flutter/material.dart';

import '../view/content_about.dart';
import '../view/content_creation.dart';
import '../view/content_experience.dart';
import '../view/content_skill.dart';
import '../model/personal_data.dart';
import '../tool/repository.dart';

// TODO 10

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PersonalData>(
        future: Repository.getPersonalData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<PersonalData> snapshot,
        ) {
          if (snapshot.hasData) {
            return _bodyHasData(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _bodyHasData(PersonalData data) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 720) {
          return ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              ContentAbout(
                data,
                horizontalPadding: constraints.maxWidth / 4,
              ),
              ContentCreation(data.creations),
              ContentExperience(data.experiences),
              ContentSkill(data.skills),
            ],
          );
        } else {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: constraints.maxHeight,
                  child: ContentAbout(
                    data,
                    horizontalPadding: constraints.maxWidth / 16,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    ContentCreation(data.creations),
                    ContentExperience(data.experiences),
                    ContentSkill(data.skills),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
