import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/models/diet.dart';
import 'package:flutter_samples/apps/diet_fast/pages/home/detail/imagen_detaild.dart';
import 'package:flutter_samples/apps/diet_fast/pages/home/detail/info_detaild.dart';

class Detaild extends StatelessWidget {
  const Detaild({Key key, @required this.diet, @required this.onTap}) : super(key: key);
  final Diet diet;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ImagenDetaild(image: diet.image, onTap: onTap), InfoDetaild(diet: diet)],
    );
  }
}
