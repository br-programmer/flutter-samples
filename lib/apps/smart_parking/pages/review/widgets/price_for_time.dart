import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';

class PriceForTime extends StatelessWidget {
  const PriceForTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('\$7', style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            ' for 2 hours',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w500, color: SmartParkingColors.myGray2),
          ),
        ),
      ],
    );
  }
}
