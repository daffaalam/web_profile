import 'package:flutter/material.dart';

import 'common/configure_nonweb.dart'
    if (dart.library.html) 'common/configure_web.dart';
import 'common/custom_scroll_behavior.dart';
import 'view/home_page.dart';

void main() {
  configureApp(); // https://flutter.dev/docs/development/ui/navigation/url-strategies
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
      title: "Web Profile",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
