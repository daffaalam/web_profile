import 'package:flutter/material.dart';

import 'common/custom_scroll_behavior.dart';
import 'view/home_page.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

// TODO 11

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      title: "Web Profile - Abiyyu Daffa Alam",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
