import 'package:flutter/material.dart';

class TitleOnBoard extends StatelessWidget {
  const TitleOnBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Space',
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 27),
        children: [
          TextSpan(
            text: 'Element',
            style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black, fontSize: 27),
          ),
        ],
      ),
    );
  }
}
