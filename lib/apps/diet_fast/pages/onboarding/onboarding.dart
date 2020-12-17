import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/models/slider.dart';
import 'package:flutter_samples/apps/diet_fast/pages/onboarding/widgets/widgets.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

import 'package:provider/provider.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderIndex(),
      child: Scaffold(
        backgroundColor: DietFastColors.background,
        body: Column(children: [const SliderImages(), const Indicator(), const TittleAndDetail(), const SkipAndNext()]),
      ),
    );
  }
}
