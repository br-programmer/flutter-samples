import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/models/music.dart';

class ListTopWeekly extends StatelessWidget {
  const ListTopWeekly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight * 3),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) {
            return GestureDetector(
              child: _ItemListTopWeekly(index: i, music: topWeekly[i]),
            );
          },
          childCount: topWeekly.length,
        ),
      ),
    );
  }
}

class _ItemListTopWeekly extends StatelessWidget {
  const _ItemListTopWeekly({Key key, @required this.index, @required this.music}) : super(key: key);
  final int index;
  final Music music;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: AspectRatio(
        aspectRatio: 16 / 2,
        child: Row(
          children: [
            Text('${index + 1}', style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), child: Image.asset(music.poster, fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(music.name,
                      style: Theme.of(context).textTheme.bodyText1, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(music.artist,
                      style: Theme.of(context).textTheme.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Icon(Icons.favorite_border),
            const SizedBox(width: 10),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
