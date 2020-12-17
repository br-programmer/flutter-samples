import 'package:flutter/material.dart';
import 'package:flutter_samples/animation/circle_three_loading/loading.dart';

class CircleThreeLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circle Three Loading'), centerTitle: true),
      body: Loading(color: Theme.of(context).primaryColor, size: 100),
    );
  }
}
