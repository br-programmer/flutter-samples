import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({Key key, this.isHome = true}) : super(key: key);
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 1.5,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/images/instagram_redesign/add.svg',
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          SvgPicture.asset(
            'assets/images/instagram_redesign/banner.svg',
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/instagram_redesign/chat.svg',
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
              if (isHome)
                Positioned(
                  right: -5,
                  top: -5,
                  child: CircleAvatar(
                    radius: 7.5,
                    backgroundColor: InstagramColors.pink,
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
