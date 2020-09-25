import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/widgets/widgets.dart' show TextInfoShoe;

class DescriptionShoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Container(width: .5, height: 40, color: Colors.black38),
          const SizedBox(width: 15),
          const TextInfoShoe(textColor: Colors.black38),
        ],
      ),
    );
  }
}
