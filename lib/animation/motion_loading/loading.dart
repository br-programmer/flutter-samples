import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({
    Key key,
    @required this.radius,
    this.alignment = Alignment.center,
    @required this.colors,
  }) : super(key: key);
  final double radius;
  final Alignment alignment;
  final List<Color> colors;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _rotate;
  Animation<double> _animation1;

  @override
  void initState() {
    super.initState();
    _controller = (AnimationController(vsync: this, duration: const Duration(seconds: 2)))..repeat();
    _animation =
        Tween(begin: .0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(.0, .425)));
    _animation1 =
        Tween(begin: .0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(.4, .85)));
    _rotate = Tween(begin: .0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(.0, .9, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => Transform(
            transform: Matrix4.identity()..rotateZ(((_rotate.value) * math.pi * 2) - math.pi / 2),
            alignment: FractionalOffset.center,
            child: CustomPaint(
              child: SizedBox.fromSize(size: Size.square(widget.radius)),
              painter: _LoadingPainter(
                paintWidth: widget.radius / 8,
                angle: ((_animation.value - _animation1.value) * 125) + .5,
                colors: widget.colors,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingPainter extends CustomPainter {
  _LoadingPainter({this.angle = .5, this.paintWidth, this.colors});

  final double angle;
  final double paintWidth;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = paintWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(Offset(0, size.height), Offset(size.width, size.height), colors);

    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawArc(rect, 0.0, getRadian(angle), false, paint);
    canvas.drawArc(rect, getRadian(180.0), getRadian(angle), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double getRadian(double angle) => math.pi / 180 * angle;
}
