import 'package:flutter/material.dart';

import 'src/common/configure_nonweb.dart'
    if (dart.library.html) 'src/common/configure_web.dart';
import 'src/common/custom_scroll_behavior.dart';
import 'src/ui/home/home_page.dart';

void main() {
  // https://flutter.dev/docs/development/ui/navigation/url-strategies
  configureApp();
  runApp(const MainApp());
}

// TODO 11

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
