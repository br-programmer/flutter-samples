import 'package:flutter/material.dart' show Color, required;
import 'package:flutter_samples/smart_parking/utils/constans.dart';

class Selection {
  final String tittle;
  final Color color;

  Selection({@required this.tittle, @required this.color});
}

final selections = <Selection>[
  Selection(tittle: '1st Floor', color: SmartParkingColors.orangeNew),
  Selection(tittle: '2nd Floor', color: SmartParkingColors.myBlue),
  Selection(tittle: '3rd Floor', color: SmartParkingColors.myPink),
];
