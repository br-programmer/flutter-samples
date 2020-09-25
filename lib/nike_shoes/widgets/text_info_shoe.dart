import 'package:flutter/material.dart';

class TextInfoShoe extends StatelessWidget {
  const TextInfoShoe({Key key, this.textColor}) : super(key: key);
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      'The Nike XTM looks to the past \nto propel you into the future.',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
