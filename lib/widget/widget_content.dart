import 'package:flutter/material.dart';

// TODO 3

class WidgetContent extends StatelessWidget {
  final Widget? title;
  final List<Widget> children;

  const WidgetContent({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: title == null
          ? _content(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
            )
          : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    right: 8.0,
                  ),
                  child: title,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  color: Colors.grey,
                  height: 2.0,
                ),
                _content(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 16.0,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _content({
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return NotificationListener<OverscrollIndicatorNotification>(
      child: ListView(
        primary: false,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: padding,
        children: children,
      ),
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return false;
      },
    );
  }
}
