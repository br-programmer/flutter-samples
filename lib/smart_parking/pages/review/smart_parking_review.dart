import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_parking/pages/review/widgets/widgets.dart';

class SmartParkingReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [const ReviewParking(), const ParkingCode()]));
  }
}
