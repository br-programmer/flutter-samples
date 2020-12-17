import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/space_concept/pages/home/widgets/rounded.dart';
import 'package:flutter_samples/apps/space_concept/utils/constans.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ImagenPlanet extends StatefulWidget {
  const ImagenPlanet({Key key}) : super(key: key);

  @override
  _ImagenPlanetState createState() => _ImagenPlanetState();
}

class _ImagenPlanetState extends State<ImagenPlanet> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: .5),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: vector.radians(360 * _controller.value),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: SpaceConceptColors.blueHeart, blurRadius: 100)],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/images/space_concept/world.png'),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Transform.rotate(
                                      angle: vector.radians(-360 * _controller.value),
                                      child: Rounded(text: '1', radius: 35))),
                            ),
                            Positioned(
                              right: MediaQuery.of(context).size.width / 6,
                              bottom: MediaQuery.of(context).size.height * .03,
                              child: Transform.rotate(
                                  angle: vector.radians(-360 * _controller.value),
                                  child: Rounded(text: '2', radius: 35)),
                            ),
                            Positioned(
                              right: MediaQuery.of(context).size.width / 7,
                              top: MediaQuery.of(context).size.height * .03,
                              child: Transform.rotate(
                                  angle: vector.radians(-360 * _controller.value),
                                  child: Rounded(text: '3', radius: 35)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
