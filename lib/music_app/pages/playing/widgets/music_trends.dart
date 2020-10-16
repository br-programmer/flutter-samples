import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MusicTrends extends StatelessWidget {
  const MusicTrends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlayerBloc = Provider.of<MusicPlayerBLoC>(context);
    return ValueListenableBuilder(
      valueListenable: musicPlayerBloc.currentTrack,
      builder: (_, value,__) {
        final music = musicPlayerBloc.musics[value];
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: AspectRatio(
            key: Key(music.name),
            aspectRatio: 16 / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/music_app/play.svg', width: 20, color: Color(0xffAFAFAF)),
                    const SizedBox(width: 5),
                    Text('${music.playing}K', style: Theme.of(context).textTheme.caption),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/music_app/heart.svg', width: 20, color: Color(0xffAFAFAF)),
                    const SizedBox(width: 5),
                    Text('${music.favorites}K', style: Theme.of(context).textTheme.caption),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/music_app/message.svg', width: 20, color: Color(0xffAFAFAF)),
                    const SizedBox(width: 5),
                    Text('${music.comment}K', style: Theme.of(context).textTheme.caption),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/music_app/cloud.svg', width: 20, color: Color(0xffAFAFAF)),
                    const SizedBox(width: 5),
                    Text('${music.download}K', style: Theme.of(context).textTheme.caption),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
