import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';

class Utilities extends StatelessWidget {
  const Utilities({Key key, @required this.utilities}) : super(key: key);

  final List<String> utilities;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: List.generate(
            utilities.length,
            (i) => Row(
              children: [
                Text(utilities[i],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: FindHomeColors.searchColor, fontWeight: FontWeight.w400)),
                if (i < utilities.length - 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: CircleAvatar(radius: 3, backgroundColor: FindHomeColors.cyan),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
