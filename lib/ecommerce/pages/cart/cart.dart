import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/ecommerce/pages/cart/widget/widgets.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';
import 'package:flutter_samples/ecommerce/widgets/button_orange.dart';
import 'package:flutter_samples/ecommerce/widgets/my_back_button.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: EcommerceColors.scaffold,
        child: Column(
          children: [
            const _HeaderCart(),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: EcommerceColors.backgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const ListProduct(),
                    const Divider(color: Colors.white24, thickness: 2),
                    const Facture(),
                    const Divider(color: Colors.white38, thickness: 0.25),
                    const ButtonCheckout(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCart extends StatelessWidget {
  const _HeaderCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const MyBackButton(), const _AddAddress()],
            ),
            Text('My Cart',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _AddAddress extends StatelessWidget {
  const _AddAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Add address',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        ButtonOrange()
      ],
    );
  }
}
