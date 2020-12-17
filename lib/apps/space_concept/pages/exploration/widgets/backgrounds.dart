import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/space_concept/utils/constans.dart';
import 'package:vector_math/vector_math.dart' as vector;

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      top: MediaQuery.of(context).size.height * .3,
      child: Transform.translate(
        offset: Offset(-120, 70),
        child: Transform.rotate(
            angle: vector.radians(-15), child: Image.asset('assets/images/space_concept/heart.jpg', fit: BoxFit.cover)),
      ),
    );
  }
}

class BackgroundBlue extends StatelessWidget {
  const BackgroundBlue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .52,
      right: 0,
      left: 0,
      child: Transform.rotate(
        angle: vector.radians(-17.5),
        child: DecoratedBox(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: SpaceConceptColors.blueHeart, blurRadius: 80, spreadRadius: 20)]),
        ),
      ),
    );
  }
}
