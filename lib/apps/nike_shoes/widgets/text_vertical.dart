import 'package:flutter/material.dart';

class TextVertical extends StatelessWidget {
  TextVertical({
    Key key,
    @required this.text,
    @required this.top,
    this.fontFamily = 'Uniwars',
    this.size = 100,
    this.padding = 20,
  }) : super(key: key);
  final String text;
  final double top;
  final String fontFamily;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: this.top,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: this.padding),
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: this.size,
              fontFamily: this.fontFamily,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.10),
            ),
          ),
        ),
      ),
    );
  }
}
