import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/pages/onboarding/widgets/widgets.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const PageOnboarding(), const IndicatorsAndButton()],
      ),
    );
  }
}
