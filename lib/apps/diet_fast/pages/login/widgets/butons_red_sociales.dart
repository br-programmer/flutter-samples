import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonsRedes extends StatelessWidget {
  const ButtonsRedes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (i) => ButtonRedSocial(path: redes[i])),
      ),
    );
  }
}

class ButtonRedSocial extends StatelessWidget {
  const ButtonRedSocial({Key key, @required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      pressedOpacity: .6,
      padding: EdgeInsets.zero,
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 12.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SvgPicture.asset(this.path),
      ),
    );
  }
}
