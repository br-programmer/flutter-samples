import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.headline5.copyWith(color: Colors.white, fontWeight: FontWeight.w400);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/space_concept/menu.svg'),
          Spacer(),
          RichText(
            text: TextSpan(
              text: 'Space',
              style: myStyle.copyWith(fontWeight: FontWeight.w700),
              children: [
                TextSpan(text: 'Element', style: myStyle),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
