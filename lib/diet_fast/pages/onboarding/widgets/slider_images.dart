import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/slider.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';
import 'package:provider/provider.dart';

class SliderImages extends StatelessWidget {
  const SliderImages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: CustomPaint(
          foregroundPainter: _SliderPainter(),
          child: Consumer<SliderIndex>(
            builder: (_, slider, __) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Container(
                key: Key(sliders[slider.index].path),
                width: double.infinity,
                child: Image.asset(sliders[slider.index].path, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = DietFastColors.primary.withOpacity(.45);

    final path1 = Path();
    path1.moveTo(0, size.height * .96);
    path1.quadraticBezierTo(size.width * .1, size.height * .9, size.width * .35, size.height * .91);
    path1.lineTo(size.width * .65, size.height * .94);
    path1.quadraticBezierTo(size.width * .92, size.height * .95, size.width, size.height * .47);
    path1.lineTo(size.width, 0);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint);
    paint.color = DietFastColors.background;

    final path2 = Path();
    path2.moveTo(0, size.height);
    path2.quadraticBezierTo(size.width * .1, size.height * .9, size.width * .5, size.height * .95);
    path2.lineTo(size.width * .6, size.height * .96);
    path2.quadraticBezierTo(size.width * .91, size.height, size.width, size.height * .6);
    path2.lineTo(size.width, 0);
    path2.lineTo(size.width, size.height * 1.1);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_SliderPainter oldDelegate) => oldDelegate != this;
}
