import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';

class DistanceAndRating extends StatelessWidget {
  const DistanceAndRating({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myStyle =
        Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500, color: SmartParkingColors.myGray2);

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: SmartParkingColors.bottonColor, borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(2.5),
          child: Icon(Ionicons.md_walk, size: 20, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Text('800m await', style: myStyle),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
              children: List.generate(
                  5,
                  (i) => Icon(FontAwesome.star,
                      size: 15, color: (i < 4 ? SmartParkingColors.myYellow : SmartParkingColors.myGray2)))),
        ),
        Row(
          children: [
            Text('(4.5', style: myStyle.copyWith(color: Colors.black)),
            Text('/5', style: myStyle),
            Text(')', style: myStyle.copyWith(color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
