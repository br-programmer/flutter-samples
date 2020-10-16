import 'package:flutter/material.dart';

class ImagenAccount extends StatelessWidget {
  const ImagenAccount({Key key, this.radius}) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'user-photo-account',
        child: CircleAvatar(radius: radius ?? 27.5, backgroundImage: AssetImage('assets/images/brayan.jpg')));
  }
}
