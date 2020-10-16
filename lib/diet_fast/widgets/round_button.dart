import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key key, this.size = 40, this.child}) : super(key: key);
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: DietFastColors.buttonColor.withOpacity(.2), blurRadius: 10),
        ],
      ),
      child: child ?? Icon(Icons.arrow_forward),
    );
  }
}
