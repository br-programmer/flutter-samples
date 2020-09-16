import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
    return MaterialApp(
      title: 'Flutter Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
