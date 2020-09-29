import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_parking/utils/constans.dart';

class EntryExit extends StatelessWidget {
  const EntryExit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Entry',
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        RotatedBox(
          quarterTurns: 3,
          child: Icon(Icons.arrow_back, color: SmartParkingColors.myGray, size: 30),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              9,
              (index) => Container(width: 3, height: 15, color: SmartParkingColors.myGray),
            ),
          ),
        ),
        Text(
          'Exit',
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
