import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/utils/constans.dart';

class Screen extends StatelessWidget {
  const Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 12.5),
      child: AspectRatio(
        aspectRatio: 16 / 1.5,
        child: ClipPath(
          clipper: _ScreenClipper(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 3, color: SuperCinesColors.screen)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  SuperCinesColors.screen.withOpacity(.45),
                  SuperCinesColors.screen.withOpacity(.25),
                  SuperCinesColors.screen.withOpacity(.1),
                  SuperCinesColors.screen.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width * .9, 0)
    ..lineTo(size.width * .1, 0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
