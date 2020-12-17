import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/pages/ask/ask.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class ButonLogin extends StatelessWidget {
  const ButonLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: CupertinoButton(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AskPage())),
        pressedOpacity: .8,
        padding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: DietFastColors.buttonColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text('Login',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
