import 'package:flutter/material.dart';
import 'package:flutter_samples/super_cines_redesign/models/movie.dart';
import 'package:flutter_samples/super_cines_redesign/models/movie_bloc.dart';
import 'package:flutter_samples/super_cines_redesign/pages/buy/buy.dart';
import 'package:flutter_samples/super_cines_redesign/utils/constans.dart';
import 'package:flutter_samples/super_cines_redesign/widgets/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DetailAndBuy extends StatelessWidget {
  const DetailAndBuy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _TrailerAbout(),
                const _TitleSubtitle(),
                const _AnioGender(),
                RoundedButton(
                    text: 'Buy Tickets',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Buy()))),
                const Authors(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleSubtitle extends StatelessWidget {
  const _TitleSubtitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieBloc = Provider.of<MovieBLoC>(context, listen: false);
    return ValueListenableBuilder<int>(
      valueListenable: movieBloc.movieSelected,
      builder: (_, selected, __) {
        final movie = movies[selected];
        return Text(
          '${movie.title.toUpperCase()}:\n${movie.subtitle.toUpperCase()}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

class Authors extends StatelessWidget {
  const Authors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieBloc = Provider.of<MovieBLoC>(context, listen: false);
    return ValueListenableBuilder<int>(
      valueListenable: movieBloc.movieSelected,
      builder: (_, selected, __) {
        final movie = movies[selected];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            movie.authors.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}

class _AnioGender extends StatelessWidget {
  const _AnioGender({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieBloc = Provider.of<MovieBLoC>(context, listen: false);
    return ValueListenableBuilder<int>(
      valueListenable: movieBloc.movieSelected,
      builder: (_, selected, __) {
        final movie = movies[selected];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              text: '${movie.anio}',
              children: [
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(radius: 3.5, backgroundColor: SuperCinesColors.yellow))),
                TextSpan(text: movie.gender),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TrailerAbout extends StatelessWidget {
  const _TrailerAbout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(fontWeight: FontWeight.w800, color: SuperCinesColors.yellow),
          children: [
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset('assets/images/supercines/play.svg'))),
            TextSpan(text: 'View Trailer'.toUpperCase()),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15))),
            TextSpan(text: 'About Movie'.toUpperCase()),
          ],
        ),
      ),
    );
  }
}
