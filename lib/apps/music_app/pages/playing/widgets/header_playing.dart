import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/bloc/music_app_bloc.dart';
import 'package:flutter_samples/apps/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/apps/music_app/widgets/play_pause.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HeaderPlaying extends StatelessWidget {
  const HeaderPlaying({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicBloc = Provider.of<MusicAppBLoC>(context, listen: false);
    final musicPlayerBloc = Provider.of<MusicPlayerBLoC>(context, listen: false);
    return AnimatedBuilder(
      animation: Listenable.merge([musicPlayerBloc.currentTrack, musicBloc.state]),
      builder: (_, __) {
        final music = musicPlayerBloc.musics[musicPlayerBloc.currentTrack.value];
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: AspectRatio(
            aspectRatio: 16 / 2,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Row(
                key: Key('${musicBloc.state.value}'),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (musicBloc.state.value == MusicAppState.playing) ...[
                    GestureDetector(
                      onTap: () => musicBloc.musicAppState = MusicAppState.initial,
                      child: Icon(Icons.arrow_back),
                    ),
                    Text('Song', style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
                    SvgPicture.asset('assets/images/music_app/shared.svg',
                        height: 20, color: Colors.white.withOpacity(.8))
                  ] else ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.asset(music.poster)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(music.name,
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Text(music.artist,
                              style: Theme.of(context).textTheme.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const PlayPause(),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
