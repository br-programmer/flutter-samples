import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 2,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderPainter()),
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
    path1.moveTo(0, size.height * .6);
    path1.quadraticBezierTo(size.width * .2, size.height * .3, size.width * .4, size.height * .65);
    path1.lineTo(size.width * .4, size.height * .65);
    path1.quadraticBezierTo(size.width * .7, size.height, size.width, size.height * .6);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    canvas.drawPath(path1, paint);

    paint.color = DietFastColors.primary;
    final path2 = Path();
    path2.moveTo(0, size.height * .45);
    path2.quadraticBezierTo(size.width * .2, size.height * .15, size.width * .4, size.height * .5);
    path2.lineTo(size.width * .4, size.height * .5);
    path2.quadraticBezierTo(size.width * .7, size.height * .85, size.width, size.height * .45);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_HeaderPainter oldDelegate) => oldDelegate != this;
}
