import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/instagram_redesign/utils/constant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int val = 0;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverStaggeredGrid.count(
        crossAxisCount: 3,
        children: myPost
            .map((e) => ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(e, fit: BoxFit.cover)))
            .toList(),
        staggeredTiles: List.generate(
          myPost.length,
          (index) {
            if (index == 0) {
              return StaggeredTile.count(2, 2);
            } else {
              if (val < 2) {
                val++;
                return StaggeredTile.count(1, 1);
              } else {
                val = 0;
                return StaggeredTile.count(2, 2);
              }
            }
          },
        ),
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
      ),
    );
  }
}
