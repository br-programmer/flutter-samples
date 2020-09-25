import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/pages/home/nike_shoes_home.dart';

class NikeShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: NikeShoesHome(),
    );
  }
}
