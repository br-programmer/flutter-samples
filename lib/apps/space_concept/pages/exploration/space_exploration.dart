import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/apps/space_concept/pages/exploration/widgets/widgets.dart';
import 'package:flutter_samples/apps/space_concept/pages/home/space_home.dart';
import 'package:flutter_samples/apps/space_concept/utils/constans.dart';

class SpaceExploration extends StatelessWidget {
  void _onTap(BuildContext context) =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SpaceHome()));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [SpaceConceptColors.black, SpaceConceptColors.black1],
                stops: [0, .45],
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                const BackgroundImage(),
                const BackgroundBlue(),
                ButtonClear(onTap: () => _onTap(context)),
                const Footer(),
                Info(onTap: () => _onTap(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
