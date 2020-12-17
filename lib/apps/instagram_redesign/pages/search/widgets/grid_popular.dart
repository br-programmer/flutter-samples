import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/instagram_redesign/utils/constant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridPopular extends StatelessWidget {
  const GridPopular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverStaggeredGrid.countBuilder(
        crossAxisCount: 4,
        itemCount: populares.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return (index == 0)
              ? Center(
                  child: Text(
                    'Populares',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(populares[index - 1], fit: BoxFit.cover),
                );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(2, index == 0 ? 1 : 2),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
