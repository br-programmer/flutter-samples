import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';

class Detail extends StatelessWidget {
  const Detail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ItemDetail(title: 'Duration:', detail: '2 Hours'),
          ItemDetail(title: 'Vechile:', detail: 'Marcedez Benz Z3'),
          ItemDetail(title: 'Parking Spot:', detail: 'A 04 (3rd Floor)'),
          ItemDetail(title: 'Payment:', detail: 'DBBL Nexus'),
        ],
      ),
    );
  }
}

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key key, @required this.title, @required this.detail}) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(title, style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w800))),
        Text(detail,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w500, color: SmartParkingColors.myGray2)),
        const SizedBox(width: 10),
        Text('Update',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w500, color: SmartParkingColors.bottonColor)),
      ],
    );
  }
}
