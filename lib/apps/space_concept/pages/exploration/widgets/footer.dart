import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.w400);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: RichText(
          text: TextSpan(
            text: 'Space',
            style: myStyle.copyWith(fontWeight: FontWeight.w700),
            children: [
              TextSpan(text: 'Element', style: myStyle),
            ],
          ),
        ),
      ),
    );
  }
}
