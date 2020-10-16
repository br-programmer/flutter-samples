import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 8.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/find_home/find_home.svg'),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: RichText(
              text: TextSpan(
                text: 'Find',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text: 'Home',
                    style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
