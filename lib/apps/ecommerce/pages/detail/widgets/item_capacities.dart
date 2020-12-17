import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCapacities extends StatelessWidget {
  const ItemCapacities({Key key, @required this.path, @required this.text}) : super(key: key);

  final String path;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(path, height: 25),
        const SizedBox(height: 3.5),
        Text(text, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
