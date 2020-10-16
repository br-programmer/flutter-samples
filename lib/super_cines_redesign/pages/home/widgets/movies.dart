import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/super_cines_redesign/models/movie.dart';
import 'package:flutter_samples/super_cines_redesign/models/movie_bloc.dart';
import 'package:provider/provider.dart';

class Movies extends StatefulWidget {
  const Movies({Key key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  PageController _controller;

  final ValueNotifier<double> _page = ValueNotifier(2.0);

  void _listener() {
    _page.value = _controller.page;
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 2, viewportFraction: .5);
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.addListener(_listener));
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller?.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieBLoC = Provider.of<MovieBLoC>(context, listen: false);
    return Expanded(
      flex: 3,
      child: LayoutBuilder(
        builder: (_, constrains) {
          return PageView.builder(
            itemCount: movies.length,
            controller: _controller,
            onPageChanged: (page) => movieBLoC.setMovieSelected(page),
            itemBuilder: (_, i) {
              final paddingHorizontal = constrains.maxWidth * .04;
              final paddingTop = lerpDouble(0, 1, (i - _page.value).abs());
              return Padding(
                padding: EdgeInsets.only(
                  left: paddingHorizontal,
                  right: paddingHorizontal,
                  top: constrains.maxHeight * (.2 * paddingTop),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(tag: movies[i].image, child: Image.asset(movies[i].image, fit: BoxFit.cover)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
