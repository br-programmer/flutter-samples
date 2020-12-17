import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(aspectRatio: 16 / 9, child: CustomPaint(painter: _HeaderPainter())),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = DietFastColors.primary.withOpacity(.3);

    final path1 = Path();
    path1.moveTo(0, size.height * .4);
    path1.quadraticBezierTo(size.width * .25, size.height * .6, size.width * .5, size.height * .5);
    path1.lineTo(size.width * .5, size.height * .5);
    path1.quadraticBezierTo(size.width * .8, size.height * .4, size.width, size.height);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    canvas.drawPath(path1, paint);

    paint.color = DietFastColors.primary;
    final path2 = Path();
    path2.moveTo(0, size.height * .35);
    path2.quadraticBezierTo(size.width * .25, size.height * .55, size.width * .5, size.height * .45);
    path2.lineTo(size.width * .5, size.height * .45);
    path2.quadraticBezierTo(size.width * .8, size.height * .35, size.width, size.height * .85);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_HeaderPainter oldDelegate) => oldDelegate != this;
}
