import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/models/parker.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Park extends StatelessWidget {
  const Park({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const IndicatorSectionParking(text: 'A5'),
            const SizedBox(height: 15),
            ParkingLot(parks: parkerA5),
            const SizedBox(height: 30),
            const IndicatorSectionParking(text: 'A6'),
            const SizedBox(height: 15),
            ParkingLot(parks: parkerA6),
          ],
        ),
      ),
    );
  }
}

class ParkingLot extends StatelessWidget {
  const ParkingLot({Key key, @required this.parks}) : super(key: key);
  final List<Parker> parks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.65 / 1),
        itemCount: parks.length,
        itemBuilder: (_, i) {
          final parker = parks[i];
          return ItemPark(
            isFull: parker.isFull,
            text: parker.text,
            isSelected: parker.isSelected,
            isRight: i.isOdd && !parker.isSelected,
            botton: i > 3,
          );
        },
      ),
    );
  }
}

class ItemPark extends StatelessWidget {
  const ItemPark({
    Key key,
    this.isFull = false,
    this.isSelected = false,
    this.text,
    this.isRight = false,
    this.botton = false,
  }) : super(key: key);

  final bool isFull;
  final bool isSelected;
  final String text;
  final bool isRight;
  final bool botton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? SmartParkingColors.myBlue.withOpacity(.2) : null,
        border: Border(
          top: BorderSide(width: 1, color: SmartParkingColors.myGray),
          bottom: botton ? BorderSide(width: 1, color: SmartParkingColors.myGray) : BorderSide.none,
          right: !isRight
              ? BorderSide(
                  width: isSelected ? 4 : 1,
                  color: isSelected ? SmartParkingColors.bottonColor : SmartParkingColors.myGray,
                )
              : BorderSide.none,
        ),
      ),
      padding: EdgeInsets.all(isFull ? 7.5 : 4),
      alignment: isRight
          ? Alignment.bottomRight
          : isSelected
              ? Alignment.center
              : Alignment.bottomLeft,
      child: isFull
          ? SvgPicture.asset('assets/images/smart_parking/car.svg')
          : Text(
              text,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  color: isSelected ? SmartParkingColors.bottonColor : SmartParkingColors.myGray,
                  fontWeight: FontWeight.w800),
            ),
    );
  }
}

class IndicatorSectionParking extends StatelessWidget {
  const IndicatorSectionParking({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: SmartParkingColors.myBlue.withOpacity(.2), borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }
}
