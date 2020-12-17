import 'package:flutter/material.dart';
import 'package:flutter_samples/animation/motion_loading/loading.dart';

class MotionLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Motion Loading'), centerTitle: true),
      body: Loading(
        colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
        radius: MediaQuery.of(context).size.width * .75,
      ),
    );
  }
}
