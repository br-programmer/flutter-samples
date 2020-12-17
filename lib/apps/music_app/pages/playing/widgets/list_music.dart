import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/apps/music_app/bloc/page_view_bloc.dart';
import 'package:provider/provider.dart';

class ListMusic extends StatelessWidget {
  const ListMusic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewBloc = Provider.of<PageViewBLoC>(context, listen: false);
    final musicPlayerBloc = Provider.of<MusicPlayerBLoC>(context, listen: false);
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return AnimatedBuilder(
              animation: pageViewBloc.pageController,
              builder: (_, __) {
                return PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageViewBloc.pageController,
                  itemCount: musicPlayerBloc.musics.length,
                  itemBuilder: (_, i) {
                    final music = musicPlayerBloc.musics[i];
                    double padding = 0.0;
                    double opacity = 0.0;
                    if (pageViewBloc.pageController.position.haveDimensions) {
                      padding = lerpDouble(0, 1, (i - (pageViewBloc.pageController.page ?? 1)).abs());
                      opacity = lerpDouble(0.0, 0.75, (i - (pageViewBloc.pageController.page ?? 1)).abs());
                      if (opacity > 1.0) opacity = 1.0;
                      if (opacity < 0.0) opacity = 0.0;
                    }

                    return Opacity(
                      opacity: 1 - opacity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: constrains.maxWidth * .05, vertical: (constrains.maxHeight * .12) * padding),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(music.poster, fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
