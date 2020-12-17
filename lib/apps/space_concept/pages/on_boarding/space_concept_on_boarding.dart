import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/space_concept/models/on_boarding_navigation.dart';
import 'package:flutter_samples/apps/space_concept/pages/on_boarding/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SpaceConcetOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => OnBoardingNavigation(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * .04),
              const TitleOnBoard(),
              const Info(),
              SizedBox(height: size.height * .05),
              const Indicator(),
              SizedBox(height: size.height * .02),
              const Footer(),
              SizedBox(height: size.height * .05),
            ],
          ),
        ),
      ),
    );
  }
}
