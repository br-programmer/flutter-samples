import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key key, this.text, this.color, @required this.onPressed}) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      pressedOpacity: .75,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: color ?? FindHomeColors.blueDark, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        child: Text(
          text ?? 'LOGIN',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
