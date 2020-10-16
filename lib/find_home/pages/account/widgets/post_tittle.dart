import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_samples/widgets/sliver_header_delegate.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 50,
        maxHeight: 50,
        child: Container(
          color: FindHomeColors.background,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Post',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
