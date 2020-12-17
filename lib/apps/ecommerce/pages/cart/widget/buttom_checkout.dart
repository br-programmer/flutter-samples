import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';

class ButtonCheckout extends StatelessWidget {
  const ButtonCheckout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: .75,
      onPressed: () {},
      padding: const EdgeInsets.fromLTRB(35, 15, 35, 30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: EcommerceColors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
