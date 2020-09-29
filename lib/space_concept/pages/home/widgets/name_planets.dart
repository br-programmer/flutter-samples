import 'package:flutter/material.dart';

class NamePlanets extends StatelessWidget {
  const NamePlanets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey);
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 5),
      child: Container(
        height: 30,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text('Earth', style: myStyle.copyWith(color: Colors.white)),
            ),
            Positioned(
              left: -17.5,
              child: Text('Saturn', style: myStyle),
            ),
            Positioned(
              right: -15,
              child: Text('Jupiter', style: myStyle),
            ),
          ],
        ),
      ),
    );
  }
}
