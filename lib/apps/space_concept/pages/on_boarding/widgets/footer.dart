import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/space_concept/models/on_boarding.dart';
import 'package:flutter_samples/apps/space_concept/models/on_boarding_navigation.dart';
import 'package:flutter_samples/apps/space_concept/pages/exploration/space_exploration.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Consumer<OnBoardingNavigation>(
        builder: (_, navigation, __) {
          int page = navigation.paginaActual;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonOnBoarding(
                text: (page == 0) ? 'Skip step' : 'Back',
                onPressed: () {
                  if (page == 0) {
                    navigation.paginaActual = itemsOnBoarding.length - 1;
                  } else {
                    navigation.paginaActual = page - 1;
                  }
                },
                buttonColor: Colors.transparent,
                textColor: Color(0xFFBEBEBE),
                paddingHorizontal: 0,
              ),
              ButtonOnBoarding(
                text: (page < itemsOnBoarding.length - 1) ? 'Next' : 'Done',
                onPressed: () {
                  if (page < itemsOnBoarding.length - 1) {
                    navigation.paginaActual = navigation.paginaActual + 1;
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SpaceExploration()));
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class ButtonOnBoarding extends StatelessWidget {
  const ButtonOnBoarding({
    Key key,
    @required this.text,
    this.textColor = Colors.white,
    this.buttonColor = Colors.black,
    @required this.onPressed,
    this.paddingHorizontal = 30,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: paddingHorizontal),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w400, color: textColor),
        ),
      ),
    );
  }
}
