import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/utils/constans.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key key, this.backgoundColor, @required this.text, @required this.onPress}) : super(key: key);
  final Color backgoundColor;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: backgoundColor ?? SmartParkingColors.bottonColor, borderRadius: BorderRadius.circular(12)),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      onPressed: onPress,
    );
  }
}
