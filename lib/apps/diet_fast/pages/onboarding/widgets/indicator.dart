import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/models/slider.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';
import 'package:flutter_samples/custom_painter/page_indicator_painter.dart';
import 'package:provider/provider.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderIndex>(
      builder: (_, slider, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: CustomPaint(
          painter: PageIndicatorPainter(
            pageCount: sliders.length,
            scrollPosition: slider.index.toDouble(),
            dotFillColor: Colors.black26,
            indicatorColor: DietFastColors.primary,
            dotRadius: 4.5,
          ),
        ),
      ),
    );
  }
}
