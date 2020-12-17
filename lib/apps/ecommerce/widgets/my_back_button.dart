import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(color: EcommerceColors.backgroundColor, borderRadius: BorderRadius.circular(7.5)),
        padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
        child: Center(
          child: RotatedBox(
            quarterTurns: 1,
            child: SvgPicture.asset('assets/images/ecommerce/arrow.svg', color: Colors.white, height: 12.5),
          ),
        ),
      ),
    );
  }
}
