import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/models/movie.dart';
import 'package:flutter_samples/apps/super_cines_redesign/models/movie_bloc.dart';
import 'package:provider/provider.dart';

class ImageAndTitle extends StatelessWidget {
  const ImageAndTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieBLoc = Provider.of<MovieBLoC>(context, listen: false);
    final movie = movies[movieBLoc.movieSelected.value];
    return AspectRatio(
      aspectRatio: 16 / 3.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(tag: movie.image, child: Image.asset(movie.image, fit: BoxFit.cover, width: 55)),
            ),
            const SizedBox(width: 10),
            Text('${movie.title}:\n${movie.subtitle}'.toUpperCase(),
                style:
                    Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
