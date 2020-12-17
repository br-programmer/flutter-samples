import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/apps/music_app/models/music.dart';
import 'package:provider/provider.dart';

class NameMusicAndArtist extends StatelessWidget {
  const NameMusicAndArtist({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlayerBloc = Provider.of<MusicPlayerBLoC>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ValueListenableBuilder(
        valueListenable: musicPlayerBloc.currentTrack,
        builder: (_, track, __) {
          final music = musics[track];
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: AspectRatio(
              key: Key(music.artist),
              aspectRatio: 16 / 2,
              child: Column(
                children: [
                  Text(music.name, style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 10),
                  Text(music.artist,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white54, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
