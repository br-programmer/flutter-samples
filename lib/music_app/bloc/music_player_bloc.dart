import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/bloc/page_view_bloc.dart';
import 'package:flutter_samples/music_app/libs/music_player.dart';
import 'package:flutter_samples/music_app/models/music.dart';
import 'package:provider/provider.dart';

class MusicPlayerBLoC extends ChangeNotifier {
  final List<Music> musics;
  MusicPlayer _musicPlayer;

  MusicPlayer get musicPlayer => _musicPlayer;
  ValueNotifier<int> currentTrack = ValueNotifier<int>(1);
  PageViewBLoC pageViewBLoC;

  MusicPlayerBLoC(this.musics, BuildContext context) {
    _musicPlayer = MusicPlayer(onFinished: this.onNext);
    pageViewBLoC = Provider.of<PageViewBLoC>(context);
  }


  void play() {
    final music = musics[currentTrack.value];
    _musicPlayer.play(music.audio);
  }

  void onNext() {
    final index = currentTrack.value + 1;
    if (index < musics.length) {
      pageViewBLoC.setPage = index;
      this.currentTrack.value = index;
      play();
    }
  }

  void onPrevius() {
    final index = currentTrack.value - 1;
    if (index >= 0) {
      pageViewBLoC.setPage = index;
      this.currentTrack.value = index;
      play();
    }
  }
}
