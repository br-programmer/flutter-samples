import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';
import 'package:flutter_samples/apps/smart_parking/widgets/widgets.dart' show RoundedButton;

class ParkingCode extends StatelessWidget {
  const ParkingCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 1),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: SmartParkingColors.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                children: [
                  Container(
                    height: 7.5,
                    width: 50,
                    decoration: BoxDecoration(color: SmartParkingColors.myGray, borderRadius: BorderRadius.circular(5)),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Parking Code',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 25),
                  RowDetailParking(textOne: 'Parking Pass', textTwo: 'Parking Slot'),
                  const SizedBox(height: 10),
                  RowDetailParking(
                    textOne: '#32-56-76',
                    textTwo: '#A 04 (F 03)',
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  RowDetailParking(textOne: 'Date From', textTwo: 'Date To'),
                  const SizedBox(height: 10),
                  RowDetailParking(
                    textOne: 'Mar 27/10:00',
                    textTwo: 'Mar 27/12:00',
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                border: Border.all(color: SmartParkingColors.myGray, width: 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: RoundedButton(text: 'Pay and Confirm', onPress: () {}, backgoundColor: SmartParkingColors.myGreen),
            ),
          ],
        ),
      ),
    );
  }
}

class RowDetailParking extends StatelessWidget {
  const RowDetailParking({
    Key key,
    @required this.textOne,
    @required this.textTwo,
    this.textStyle,
  }) : super(key: key);
  final String textOne;
  final String textTwo;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: SmartParkingColors.myGray2, fontWeight: FontWeight.w600, fontSize: 17);

    return Row(
      children: [
        Expanded(child: Text(textOne, style: textStyle ?? style)),
        Expanded(child: Text(textTwo, style: textStyle ?? style)),
      ],
    );
  }
}
