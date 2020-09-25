import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/utils/constans.dart';
import 'package:flutter_samples/nike_shoes/widgets/widgets.dart' show TextInfoShoe;

class CardInfoShoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.22,
      left: 0,
      child: ClipPath(
        clipper: ClipperHomeDetail(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.72,
          color: NikeShoesColors.colorGreen,
          child: TextInfoShoe(),
        ),
      ),
    );
  }
}

class ClipperHomeDetail extends CustomClipper<Path> {
  ClipperHomeDetail([this.border = 22]);
  final double border;

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0, size.height)
    ..lineTo(size.width - this.border, size.height)
    ..quadraticBezierTo(size.width, size.height, size.width, size.height - this.border)
    ..quadraticBezierTo(size.width, size.height, size.width, size.height - this.border)
    ..lineTo(size.width * 0.85, 0)
    ..close();

  @override
  bool shouldReclip(ClipperHomeDetail oldClipper) => oldClipper.border != this.border;
}
