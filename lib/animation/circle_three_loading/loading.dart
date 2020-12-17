import 'package:flutter/material.dart';
import 'package:flutter_samples/animation/circle_three_loading/delay_tween.dart';

class Loading extends StatefulWidget {
  const Loading({Key key, this.color, this.size = 40.0}) : super(key: key);
  final Color color;
  final double size;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = (AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    ))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    return Center(
      child: SizedBox.fromSize(
        size: Size(size * 2, size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return ScaleTransition(
              scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2).animate(_controller),
              child: SizedBox.fromSize(
                size: Size.square(size * 0.5),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: widget.color ?? Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
