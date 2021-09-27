import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// https://flutter.dev/docs/release/breaking-changes/default-scroll-behavior-drag

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return PointerDeviceKind.values.toSet();
  }
}
