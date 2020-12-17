import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  const Points({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: ClipPath(clipper: _CurvesPointClipper(), child: CustomPaint(painter: _PointsPainter())));
  }
}

class _CurvesPointClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..quadraticBezierTo(size.width * .18, size.height * .44, size.width * .22, size.height * .5)
    ..cubicTo(
        size.width * .25, size.height * .54, size.width * .29, size.height * .55, size.width * .36, size.height * .53)
    ..cubicTo(
        size.width * .41, size.height * .51, size.width * .62, size.height * .32, size.width * .70, size.height * .33)
    ..cubicTo(
        size.width * .78, size.height * .33, size.width * .79, size.height * .40, size.width * .86, size.height * .39)
    ..quadraticBezierTo(size.width * .91, size.height * .38, size.width * .92, size.height * .29)
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height * .6)
    ..quadraticBezierTo(size.width * .94, size.height * .54, size.width * .92, size.height * .51)
    ..cubicTo(
        size.width * .90, size.height * .49, size.width * .88, size.height * .45, size.width * .86, size.height * .45)
    ..cubicTo(
        size.width * .81, size.height * .42, size.width * .78, size.height * .48, size.width * .74, size.height * .55)
    ..cubicTo(
        size.width * .70, size.height * .62, size.width * .67, size.height * .51, size.width * .62, size.height * .49)
    ..cubicTo(size.width * .51, size.height * .43, size.width * .47, size.height * .97, size.width * .34, size.height)
    ..cubicTo(size.width * .27, size.height, size.width * .19, size.height * .66, size.width * .16, size.height * .54)
    ..cubicTo(
        size.width * .16, size.height * .51, size.width * .13, size.height * .48, size.width * .08, size.height * 0.45)
    ..quadraticBezierTo(size.width * .05, size.height * .43, 0, size.height * .39)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}

class _PointsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.height), Offset(size.width, size.height), [Color(0xFF48529F), Color(0xFFC93A8D)]);

    for (var i = 0; i < size.width; i += 12) {
      double x = i.toDouble();
      for (var j = 0; j < size.height; j += 7) {
        double y = j.toDouble();
        canvas.drawCircle(Offset(x, y), 2.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_PointsPainter oldDelegate) => oldDelegate != this;
}
