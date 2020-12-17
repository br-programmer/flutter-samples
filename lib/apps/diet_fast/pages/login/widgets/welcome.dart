import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Welcome',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
