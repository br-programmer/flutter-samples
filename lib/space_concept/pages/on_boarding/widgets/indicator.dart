import 'package:flutter/material.dart';
import 'package:flutter_samples/custom_painter/page_indicator_painter.dart';
import 'package:flutter_samples/space_concept/models/on_boarding.dart';
import 'package:flutter_samples/space_concept/models/on_boarding_navigation.dart';
import 'package:provider/provider.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingNavigation>(
      builder: (_, navigation, __) {
        return CustomPaint(
          painter: PageIndicatorPainter(
            pageCount: itemsOnBoarding.length,
            scrollPosition: navigation.paginaActual.toDouble(),
            dotFillColor: Colors.black38,
            indicatorColor: Colors.black,
          ),
        );
      },
    );
  }
}
