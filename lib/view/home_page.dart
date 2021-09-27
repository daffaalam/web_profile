import 'package:flutter/material.dart';

import '../common/repository.dart';
import '../model/personal_data.dart';
import 'content_about.dart';
import 'content_creation.dart';
import 'content_experience.dart';
import 'content_skill.dart';
import 'content_update.dart';

// TODO 10

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
            return _bodyHasData(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _bodyHasData(PersonalData data) {
    List<Widget> contents = <Widget>[
      ContentCreation(data.creations),
      ContentExperience(data.experiences),
      ContentSkill(data.skills),
      ContentUpdate(data),
    ];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              ContentAbout(
                data,
                horizontalPadding: constraints.maxWidth / 4,
              ),
              ...contents,
            ],
          );
        } else {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: ContentAbout(
                    data,
                    horizontalPadding: constraints.maxWidth / 16,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: contents,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
