import 'package:flutter/material.dart';
import 'package:flutter_samples/super_cines_redesign/models/movie.dart';
import 'package:flutter_samples/super_cines_redesign/models/movie_bloc.dart';
import 'package:provider/provider.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({Key key}) : super(key: key);

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final _movement = -50.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieBLoC = Provider.of<MovieBLoC>(context, listen: false);
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Positioned.fill(
            left: _movement * _controller.value,
            right: _movement * (1 - _controller.value),
            child: ValueListenableBuilder<int>(
              valueListenable: movieBLoC.movieSelected,
              builder: (_, selected, __) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  key: Key(selected.toString()),
                  child: Image.asset(movies[selected].poster, fit: BoxFit.cover),
                ),
              ),
            ),
          );
        });
  }
}
