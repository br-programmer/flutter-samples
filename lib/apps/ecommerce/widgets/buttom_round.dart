import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';

class ButtomRound extends StatelessWidget {
  const ButtomRound({Key key, this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
          width: 35,
          decoration: BoxDecoration(color: EcommerceColors.backgroundColor, borderRadius: BorderRadius.circular(7.5)),
          padding: const EdgeInsets.all(5),
          child: Center(child: Icon(Icons.clear, color: Colors.white))),
    );
  }
}
