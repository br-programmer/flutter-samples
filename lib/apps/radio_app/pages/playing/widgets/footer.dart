import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/radio_app/pages/home/widgets/controls.dart';
import 'package:flutter_samples/apps/radio_app/pages/home/widgets/volumen.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Controls(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Volumen(),
          ),
        ],
      ),
    );
  }
}
