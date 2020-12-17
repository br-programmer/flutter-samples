import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/bloc/page_view_bloc.dart';
import 'package:flutter_samples/apps/diet_fast/models/diet.dart';
import 'package:provider/provider.dart';

class ListViewDiet extends StatelessWidget {
  const ListViewDiet({Key key, @required this.selected}) : super(key: key);

  final ValueChanged<int> selected;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PageViewBLoC>(context, listen: false);
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 15,
        child: LayoutBuilder(
          builder: (_, constrains) => PageView.builder(
            controller: bloc.controller,
            itemCount: listDiet.length,
            itemBuilder: (_, i) {
              final diet = listDiet[i];
              return GestureDetector(
                onTap: () => selected(i),
                child: ItemListDiet(currentPage: i, diet: diet, constrains: constrains),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemListDiet extends StatelessWidget {
  const ItemListDiet({
    Key key,
    @required this.currentPage,
    @required this.diet,
    @required this.constrains,
  }) : super(key: key);

  final int currentPage;
  final Diet diet;
  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PageViewBLoC>(context, listen: false);
    return AnimatedBuilder(
        animation: bloc.controller,
        builder: (context, snapshot) {
          final vertical = lerpDouble(0, 1, (currentPage - bloc.controller.page).abs());
          double opacity = lerpDouble(0.0, 0.5, (currentPage - bloc.controller.page).abs());
          if (opacity > 1.0) opacity = 1.0;
          if (opacity < 0.0) opacity = 0.0;
          return Opacity(
            opacity: 1 - opacity,
            child: Padding(
              padding: EdgeInsets.only(
                  top: (constrains.maxHeight) * (.1 * vertical), bottom: constrains.maxHeight * (.1 * vertical)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
                        ),
                        child: Image.asset(diet.image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      diet.title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
