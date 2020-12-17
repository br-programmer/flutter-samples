import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/space_concept/pages/home/widgets/list_info_planet.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ImagenPlanetExplore extends StatefulWidget {
  const ImagenPlanetExplore({
    Key key,
  }) : super(key: key);

  @override
  _ImagenPlanetExploreState createState() => _ImagenPlanetExploreState();
}

class _ImagenPlanetExploreState extends State<ImagenPlanetExplore> with SingleTickerProviderStateMixin {
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
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: -size.height / 3.5,
            left: -size.width / 3,
            right: -size.width / 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: .5),
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) => Transform.rotate(angle: vector.radians(360 * _controller.value), child: child),
                child: Image.asset(
                  'assets/images/space_concept/world.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const ListInfoPlanet(),
        ],
      ),
    );
  }
}
