import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class TitleAsk extends StatelessWidget {
  const TitleAsk({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline5.copyWith(color: Colors.black, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: RichText(
        text: TextSpan(
          text: "Let's do your diet",
          style: style,
          children: [
            TextSpan(
              text: ' katy',
              style: style.copyWith(color: DietFastColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
