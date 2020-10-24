import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';

class InputPhone extends StatelessWidget {
  const InputPhone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomPainterInput(),
      child: CupertinoTextField(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        placeholder: 'Your phone number',
        keyboardType: TextInputType.phone,
        cursorColor: RadioAppColors.redPurple,
        placeholderStyle: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white54),
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
        decoration: BoxDecoration(
            border: Border.all(color: RadioAppColors.redPurple, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent),
      ),
    );
  }
}

class _CustomPainterInput extends CustomPainter {
  _CustomPainterInput({this.borderWidth = 5, this.radius = 5});

  final double borderWidth;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final rectShadow = RRect.fromRectAndRadius(Offset(4, 4) & size, Radius.circular(radius));
    final shadowPaint = Paint()
      ..strokeWidth = borderWidth
      ..color = RadioAppColors.redPurple.withOpacity(.4)
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawRRect(rectShadow, shadowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
