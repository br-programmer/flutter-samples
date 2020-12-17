import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 4.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              SuperCinesColors.blueGray,
              SuperCinesColors.blueGray.withOpacity(.9),
              SuperCinesColors.blueGray.withOpacity(.75),
              SuperCinesColors.blueGray.withOpacity(.6),
              SuperCinesColors.blueGray.withOpacity(.55),
              SuperCinesColors.blueGray.withOpacity(.4),
              SuperCinesColors.blueGray.withOpacity(.25),
              SuperCinesColors.blue.withOpacity(.15),
            ],
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/supercines/menu.svg'),
                SvgPicture.asset('assets/images/supercines/logo.svg'),
                ClipOval(child: Image.asset('assets/images/brayan.jpg', width: 40)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/supercines/location.svg'),
                const SizedBox(width: 10),
                Text(
                  'CC. El Dorado',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
