import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/radio_app/1.png'), fit: BoxFit.cover),
            ),
          ),
          Opacity(
            opacity: .35,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [RadioAppColors.blueAccent.withOpacity(.75), Colors.transparent],
                  stops: [.1, 1],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: .5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Color(0xFF3A2242)],
                  stops: [.1, .4],
                ),
              ),
            ),
          ),
          Positioned.fill(
            bottom: -15,
            child: Opacity(
              opacity: .3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/radio_app/dj.png'), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
