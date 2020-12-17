import 'package:flutter/material.dart';

class ButtonClear extends StatelessWidget {
  const ButtonClear({Key key, @required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      top: 20,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(Icons.clear, size: 20),
        ),
      ),
    );
  }
}
