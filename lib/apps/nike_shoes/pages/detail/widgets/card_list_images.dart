import 'package:flutter/material.dart';

class CardListImage extends StatelessWidget {
  const CardListImage({Key key, @required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -13),
      child: Padding(
        padding: EdgeInsets.only(left: 2.5, top: 10, bottom: 5),
        child: Card(
          elevation: 7,
          color: Colors.white,
          shadowColor: Colors.black54,
          child: ClipPath(
            clipper: ClipperCardImage(),
            child: Image.asset(
              this.path,
            ),
          ),
        ),
      ),
    );
  }
}

class ClipperCardImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(0, size.height - 5)
    ..quadraticBezierTo(0, size.height, 5, size.height)
    ..lineTo(size.width - 5, size.height)
    ..quadraticBezierTo(size.width, size.height, size.width, size.height - 5)
    ..lineTo(size.width, 5)
    ..quadraticBezierTo(size.width, 0, size.width - 5, 0)
    ..lineTo(5, 0)
    ..quadraticBezierTo(0, 0, 0, 5)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
