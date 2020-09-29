import 'package:flutter/material.dart';

class Rounded extends StatelessWidget {
  const Rounded({Key key, @required this.text, this.radius = 30}) : super(key: key);
  final String text;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff60607E),
      ),
      child: Text(text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
