import 'package:flutter/material.dart';

import 'view/home_page.dart';

void main() {
  runApp(
    MainApp(),
  );
}

// TODO 11

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Curriculum Vitae - Abiyyu Daffa' Alam",
      theme: ThemeData.dark(),
    );
  }
}
