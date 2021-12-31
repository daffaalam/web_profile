import 'package:flutter/material.dart';

class StarsRating extends StatelessWidget {
  const StarsRating({
    Key? key,
    required this.rating,
  })  : assert(rating >= 0),
        assert(rating <= 100),
        super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Icon>.generate(
        5,
        (int index) {
          int count = (index + 1) * 2;
          int total = count - (rating ~/ 10);
          IconData iconData;
          if (total < 1) {
            iconData = Icons.star;
          } else if (total > 1) {
            iconData = Icons.star_border;
          } else {
            iconData = Icons.star_half;
          }
          return Icon(
            iconData,
          );
        },
      ),
    );
  }
}
