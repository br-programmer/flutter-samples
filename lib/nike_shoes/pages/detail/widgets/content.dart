import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/widgets/widgets.dart' show TextVertical;
import 'package:flutter_samples/nike_shoes/pages/detail/widgets/widgets.dart' show Back, DetailTop, DetailBoton;

class Content extends StatelessWidget {
  const Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Expanded(child: Column(children: [Back(), DetailTop()])),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  TextVertical(text: 'ADD', top: 80, fontFamily: 'Orbitron', size: 110, padding: 0),
                  DetailBoton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
