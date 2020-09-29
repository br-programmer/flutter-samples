import 'package:flutter/material.dart';
import 'package:flutter_samples/space_concept/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        color: SpaceConceptColors.bottonNavigation.withOpacity(.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            iconsNavigation.length,
            (i) => SvgPicture.asset(
              iconsNavigation[i],
              height: (i == 0) ? 25 : 20,
              color: (i == 0) ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
