import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key key, this.isFirst = false, @required this.image, this.radius = 35}) : super(key: key);
  final bool isFirst;
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFirst ? Theme.of(context).accentColor : null,
        gradient: !isFirst
            ? LinearGradient(
                colors: [InstagramColors.pink, InstagramColors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
      padding: EdgeInsets.all(2),
      child: ClipOval(
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
