import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class HeaderFooter extends StatelessWidget {
  const HeaderFooter({Key key, this.isHeader = true}) : super(key: key);
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isHeader ? Alignment.topCenter : Alignment.bottomCenter,
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: CustomPaint(painter: isHeader ? _HeaderPainter() : _FooterPainter()),
      ),
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
    path1.moveTo(0, size.height * .8);
    path1.quadraticBezierTo(size.width * .25, size.height * .25, size.width * .525, size.height * .625);
    path1.lineTo(size.width * .525, size.height * .625);
    path1.quadraticBezierTo(size.width * .85, size.height, size.width, size.height * .8);
    path1.lineTo(size.width, 0);
    path1.lineTo(0, 0);
    path1.close();
    canvas.drawPath(path1, paint);

    paint.color = DietFastColors.primary;
    final path2 = Path();
    path2.moveTo(0, size.height * .6);
    path2.quadraticBezierTo(size.width * .25, size.height * .1, size.width * .525, size.height * .475);
    path2.lineTo(size.width * .525, size.height * .475);
    path2.quadraticBezierTo(size.width * .85, size.height * .85, size.width, size.height * .65);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_HeaderPainter oldDelegate) => oldDelegate != this;
}

class _FooterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = DietFastColors.primary.withOpacity(.2);

    final path1 = Path();
    path1.moveTo(0, size.height * .8);
    path1.quadraticBezierTo(size.width * .3, size.height * .25, size.width * .65, size.height * .45);
    path1.lineTo(size.width * .65, size.height * .45);
    path1.quadraticBezierTo(size.width * .85, size.height * .6, size.width, size.height * .1);
    path1.lineTo(size.width, 0);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint);

    paint.color = DietFastColors.primary;
    final path2 = Path();
    path2.moveTo(0, size.height * .95);
    path2.quadraticBezierTo(size.width * .3, size.height * .35, size.width * .65, size.height * .58);
    path2.lineTo(size.width * .65, size.height * .58);
    path2.quadraticBezierTo(size.width * .85, size.height * .7, size.width, size.height * .25);
    path2.lineTo(size.width, 0);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_FooterPainter oldDelegate) => oldDelegate != this;
}
