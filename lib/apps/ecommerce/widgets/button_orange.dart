import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonOrange extends StatelessWidget {
  const ButtonOrange({Key key, this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: EcommerceColors.orange, borderRadius: BorderRadius.circular(7.5)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
      child: Center(
          child: SvgPicture.asset(path ?? 'assets/images/ecommerce/location.svg', color: Colors.white, height: 20)),
    );
  }
}
