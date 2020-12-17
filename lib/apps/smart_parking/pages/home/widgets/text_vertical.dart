import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';

class TextVertical extends StatelessWidget {
  const TextVertical({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        '2  WAY  TRAFFIC',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: SmartParkingColors.myGray, letterSpacing: 5, fontWeight: FontWeight.w800),
      ),
    );
  }
}
