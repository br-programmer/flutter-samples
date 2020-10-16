import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite({Key key, this.size = 45, this.child, this.onTap}) : super(key: key);
  final double size;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)]),
        child: child ?? SvgPicture.asset('assets/images/find_home/heart.svg', color: Colors.pink),
      ),
    );
  }
}
