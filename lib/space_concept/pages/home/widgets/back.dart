import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Back extends StatelessWidget {
  const Back({Key key, @required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: GestureDetector(onTap: onTap, child: SvgPicture.asset('assets/images/space_concept/back.svg', height: 20)),
    );
  }
}
