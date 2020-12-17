import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_samples/apps/find_home/widgets/rounded_button.dart';

class PriceReserved extends StatelessWidget {
  const PriceReserved({Key key, @required this.price}) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 5),
            ]),
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Text(
              '\$${price.toStringAsFixed(0)} usd',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 50),
            Expanded(child: RoundedButton(onPressed: () {}, text: 'Reserved now!', color: FindHomeColors.cyan))
          ],
        ),
      ),
    );
  }
}
