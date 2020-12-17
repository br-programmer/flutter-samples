import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/radio_app/clippers/polygon_path_drawer.dart';

class ControlPolygon extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color color;

  final PaintingStyle paintingStyle;

  ControlPolygon(
      {@required this.child, this.borderRadius: 0.0, @required this.color, this.paintingStyle = PaintingStyle.fill});

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: PolygonPainter(PolygonPathSpecs(sides: 6, borderRadiusAngle: borderRadius), color, paintingStyle),
        child: this.child,
      );
}

class PolygonPainter extends CustomPainter {
  final PolygonPathSpecs specs;
  final Color color;
  final PaintingStyle paintingStyle;

  PolygonPainter(this.specs, this.color, this.paintingStyle);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
        PolygonPathDrawer(size: size, specs: specs).draw(),
        Paint()
          ..color = color
          ..style = paintingStyle
          ..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(PolygonPainter oldDelegate) => oldDelegate != this;
}
