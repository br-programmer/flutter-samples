import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/utils/constans.dart';

class Price extends StatelessWidget {
  const Price({Key key, this.isDetail = false}) : super(key: key);
  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDetail ? 20 : 0),
      child: Row(
        children: [
          Text(
            '\$',
            style: TextStyle(
              fontFamily: 'Orbitron',
              fontSize: 24,
              color: !isDetail ? NikeShoesColors.colorGreen : Colors.black38,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '190,00',
            style: TextStyle(
              fontFamily: 'Uniwars',
              fontSize: 25,
              color: isDetail ? NikeShoesColors.colorGreen : null,
            ),
          ),
        ],
      ),
    );
  }
}
