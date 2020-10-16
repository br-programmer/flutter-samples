import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/widgets/round_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagenDetaild extends StatelessWidget {
  const ImagenDetaild({Key key, this.image, this.onTap}) : super(key: key);
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Positioned(
            top: kToolbarHeight * 1.75,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: RoundButton(size: 50),
                    ),
                  ),
                  RoundButton(
                    child: SvgPicture.asset(
                      'assets/images/diet_fast/heart.svg',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
