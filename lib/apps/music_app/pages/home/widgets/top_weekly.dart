import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/utils/constans.dart';
import 'package:flutter_samples/apps/widgets/sliver_header_delegate.dart';

class TopWeekly extends StatelessWidget {
  const TopWeekly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverCustomHeaderDelegate(
        maxHeight: 50,
        minHeight: 50,
        child: Container(
          color: MusicAppColors.primary,
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            'Top weekly',
            style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
