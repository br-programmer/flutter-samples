import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/animation/circle_three_loading/circle_three_loading.dart';
import 'package:flutter_samples/animation/motion_loading/motion_loading.dart';
import 'package:flutter_samples/animation/sliver_appbar_animation/sliver_appbar_animation.dart';

class HomeAnimationsPage extends StatelessWidget {
  void _handlerToPage(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => child));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Animations - BrProgrammer'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Circle Trhee Loading'),
              onPressed: () => _handlerToPage(context, CircleThreeLoading()),
            ),
            const SizedBox(height: 10),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Motion Loading'),
              onPressed: () => _handlerToPage(context, MotionLoading()),
            ),
            const SizedBox(height: 10),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('SliverAppBar Animation'),
              onPressed: () => _handlerToPage(context, SliverAppBarAnimation()),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
