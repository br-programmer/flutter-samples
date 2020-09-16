import 'package:flutter/material.dart';

class PageIndicatorPainter extends CustomPainter {
  PageIndicatorPainter({
    @required this.pageCount,
    this.dotRadius = 3,
    this.spacing = 10,
    this.scrollPosition = 0.0,
    Color dotFillColor = Colors.grey,
    Color indicatorColor = Colors.white,
  })  : dotFillPaint = Paint()..color = dotFillColor,
        indicatorPaint = Paint()..color = indicatorColor;

  final int pageCount;
  final double dotRadius;
  final double spacing;
  final double scrollPosition;
  final Paint dotFillPaint;
  final Paint indicatorPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth = (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);

    _drawDots(canvas, center, totalWidth);

    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final int pageIndexToLeft = scrollPosition.floor();
    final double leftDotX = (center.dx - (totalWidth / 2)) + (pageIndexToLeft * ((2 * dotRadius) + spacing));
    final double transitionPercent = scrollPosition - pageIndexToLeft;

    final double lagginLeftPositionPercent = (transitionPercent - 0.3).clamp(0.0, 1.0) / 0.7;

    final double indicatorLeftX = leftDotX + (lagginLeftPositionPercent * ((2 * dotRadius) + spacing));

    final double acceleratedRightPositionPercent = (transitionPercent / 0.5).clamp(0.0, 1.0);

    final double indicatorRightX =
        leftDotX + (acceleratedRightPositionPercent * ((2 * dotRadius) + spacing)) + (2 * dotRadius);

    canvas.drawRRect(
        RRect.fromLTRBR(indicatorLeftX, -dotRadius, indicatorRightX, dotRadius, Radius.circular(dotRadius)),
        indicatorPaint);
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    Offset dotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    for (int i = 0; i < pageCount; i++) {
      canvas.drawCircle(dotCenter, dotRadius, dotFillPaint);
      dotCenter = dotCenter.translate((2 * dotRadius) + spacing, 0);
    }
  }

  @override
  bool shouldRepaint(PageIndicatorPainter old) => true;
}
