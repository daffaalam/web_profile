import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/common/custom_scroll_behavior.dart';
import 'src/ui/home/home_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomePage();
          },
        );
      },
      title: 'Web Profile | Abiyyu Daffa Alam',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
