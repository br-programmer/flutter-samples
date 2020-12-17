import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/apps/nike_shoes/utils/constans.dart';
import 'package:flutter_samples/apps/nike_shoes/widgets/widgets.dart' show TextVertical, Counter;

class NikeShoesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NikeShoesColors.backgroundColor,
      body: Stack(
        children: [
          TextVertical(text: 'XTM', top: -18),
          CustomHeader(),
          MyCustomFooter(),
          CardInfoShoe(),
          CardShoe(),
          Counter(),
        ],
      ),
    );
  }
}
