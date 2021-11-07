import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem(this.index, this.rating);
  @override
  Widget build(BuildContext context) {
    return index <= rating
        ? Image.asset(
            'assets/icon_star.png',
            width: 20,
          )
        : Image.asset(
            'assets/icon_star_grey.png',
            width: 20,
          );
  }
}
