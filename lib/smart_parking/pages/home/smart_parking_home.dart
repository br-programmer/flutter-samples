import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_parking/pages/home/widgets/widgets.dart' show SelectionFloor, Parking;
import 'package:flutter_samples/smart_parking/pages/review/smart_parking_review.dart';
import 'package:flutter_samples/smart_parking/utils/constans.dart';
import 'package:flutter_samples/smart_parking/widgets/widgets.dart' show MyCustomAppBar, RoundedButton;

class SmartParkingHome extends StatelessWidget {
  void _handler(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => SmartParkingReview()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SmartParkingColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            MyCustomAppBar(text: 'Pick Parking Spot', onTap: () {}),
            const SizedBox(height: 30),
            SelectionFloor(),
            const SizedBox(height: 30),
            const Parking(),
            const SizedBox(height: 20),
            RoundedButton(text: 'Proceed with Spot (A 04)', onPress: () => _handler(context)),
          ],
        ),
      ),
    );
  }
}
