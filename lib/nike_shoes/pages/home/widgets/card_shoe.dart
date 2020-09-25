import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/utils/constans.dart';

class CardShoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: MediaQuery.of(context).size.height * 0.31,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          ClipPath(
            clipper: ClipperHomeCardShoe(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width * 0.85,
              color: NikeShoesColors.whiteCard,
              child: Image.asset(
                'assets/images/nike_shoes/nike_base.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: -10,
            child: Image.asset(
              'assets/images/nike_shoes/nike_shoe.png',
              height: MediaQuery.of(context).size.height * .25,
            ),
          ),
        ],
      ),
    );
  }
}

class ClipperHomeCardShoe extends CustomClipper<Path> {
  ClipperHomeCardShoe([this.border = 40]);
  final double border;

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0, size.height - this.border)
    ..quadraticBezierTo(0, size.height, this.border, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..lineTo(this.border + 50, 0)
    ..quadraticBezierTo(this.border + 10, 0, this.border, this.border)
    ..lineTo(0, size.height - this.border)
    ..close();

  @override
  bool shouldReclip(ClipperHomeCardShoe oldClipper) => oldClipper.border != this.border;
}
