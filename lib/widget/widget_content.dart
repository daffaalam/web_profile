import 'package:flutter/material.dart';

// TODO 3

class WidgetContent extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  WidgetContent({
    this.title,
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this.title == null
          ? _content(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
            )
          : Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    right: 8.0,
                  ),
                  child: this.title,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  color: Colors.grey,
                  height: 2.0,
                ),
                _content(
                  padding: EdgeInsets.only(
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
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: padding,
        children: this.children,
      ),
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
    );
  }
}
