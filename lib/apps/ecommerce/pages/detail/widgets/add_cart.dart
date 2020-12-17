import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';

class AddCart extends StatelessWidget {
  const AddCart({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: .75,
      onPressed: () {},
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: EcommerceColors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add Cart',
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
            Text(
              '$text.00',
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
