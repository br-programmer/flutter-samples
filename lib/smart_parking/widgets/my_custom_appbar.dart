import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({Key key, @required this.text, @required this.onTap, this.isReview = false}) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool isReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: onTap, child: Icon(Icons.arrow_back_ios, color: isReview ? Colors.black : Colors.white)),
        Spacer(),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: isReview ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
        ),
        Spacer(),
      ],
    );
  }
}
