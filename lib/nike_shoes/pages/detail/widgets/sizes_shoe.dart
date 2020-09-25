import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/utils/constans.dart';

class SizesShoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizesShoes
          .map(
            (size) => Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border:
                    (size == '7.5') ? Border(bottom: BorderSide(color: NikeShoesColors.colorGreen, width: 2)) : null,
              ),
              child: Text(
                size,
                style: TextStyle(
                  fontFamily: 'Uniwars',
                  color: (size == '5' || size == '10')
                      ? Colors.grey.withOpacity(.5)
                      : (size == '7.5') ? Colors.black : Colors.grey,
                  fontSize: (size == '7.5') ? 20 : 14,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
