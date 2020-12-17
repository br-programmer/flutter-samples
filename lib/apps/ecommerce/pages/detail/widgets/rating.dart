import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key key, @required this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5, (index) => Icon((index < rating) ? Icons.star : Icons.star_border, color: Color(0xFFFFB800))),
    );
  }
}
