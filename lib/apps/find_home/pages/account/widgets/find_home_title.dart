import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';

class FindHomeTitle extends StatelessWidget {
  const FindHomeTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: FindHomeColors.background,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text('FindHome Gold',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
