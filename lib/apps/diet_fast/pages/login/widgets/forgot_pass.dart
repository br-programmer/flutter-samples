import 'package:flutter/material.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5),
      child: Text('Forgot you password?',
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black45)),
    );
  }
}
