import 'package:flutter/material.dart';

class Facture extends StatelessWidget {
  const Facture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
      child: Column(
        children: [
          _DetailFacture(text1: 'Total', text2: '\$6,000 us'),
          const SizedBox(height: 15),
          _DetailFacture(text1: 'Delivery', text2: 'Free'),
        ],
      ),
    );
  }
}

class _DetailFacture extends StatelessWidget {
  const _DetailFacture({Key key, this.text1, this.text2}) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white70),
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
