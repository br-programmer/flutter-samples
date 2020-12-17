import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/utils/constans.dart';
import 'package:flutter_samples/apps/super_cines_redesign/widgets/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({Key key, this.isBuy = false, this.onTap}) : super(key: key);
  final bool isBuy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: isBuy ? 16 / 3.75 : 16 / 4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              SuperCinesColors.blueGray,
              SuperCinesColors.blueGray,
              SuperCinesColors.blueGray,
              SuperCinesColors.blueGray.withOpacity(.9),
              SuperCinesColors.blueGray.withOpacity(.8),
              SuperCinesColors.blueGray.withOpacity(.7),
              SuperCinesColors.blue.withOpacity(.5),
              SuperCinesColors.blue.withOpacity(.3),
              SuperCinesColors.blue.withOpacity(.1),
              SuperCinesColors.blue.withOpacity(0),
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: isBuy
                  ? Text(
                      '\$3,75',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  : SvgPicture.asset('assets/images/supercines/pop.svg'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: SvgPicture.asset('assets/images/supercines/arrow.svg'),
                ),
              ),
            ),
            if (isBuy)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: RoundedButton(onTap: () {}, text: 'PAY'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
