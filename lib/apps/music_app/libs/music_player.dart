import 'dart:async';

import 'package:flutter_samples/apps/music_app/models/music.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter/material.dart';

enum MusicPlayerStatus { initial, loading, error, playing, paused }

class MusicPlayer {
  MusicPlayer({@required this.onFinished}) {
    this._init();
  }

  final void Function() onFinished;

  dispose() async {
    await _subscription?.cancel();
    await (await this._completer.future).closeAudioSession();
  }

  Completer<FlutterSoundPlayer> _completer = Completer();
  ValueNotifier<MusicPlayerStatus> _status = ValueNotifier(MusicPlayerStatus.initial);

  ValueNotifier<Duration> _position = ValueNotifier(Duration.zero);

  Duration _duration;
  StreamSubscription _subscription;

  Duration get duration => _duration;

  ValueNotifier<MusicPlayerStatus> get status => _status;

  ValueNotifier<Duration> get position => _position;

  bool get loading {
    return _status.value == MusicPlayerStatus.loading;
  }

  bool get initial {
    return _status.value == MusicPlayerStatus.initial;
  }

  bool get playing {
    return _status.value == MusicPlayerStatus.playing;
  }

  bool get paused {
    return _status.value == MusicPlayerStatus.paused;
  }

  bool get error {
    return _status.value == MusicPlayerStatus.error;
  }

  Future<void> _init() async {
    final FlutterSoundPlayer player = await FlutterSoundPlayer().openAudioSession();
    this._completer.complete(player);
  }

  Future<void> play(String uri) async {
    _status.value = MusicPlayerStatus.loading;
    _duration = null;
    _position.value = Duration.zero;
    await _subscription?.cancel();
    final player = await this._completer.future;
    await player.startPlayer(
      fromURI: uri,
      whenFinished: () {
        this.onFinished();
      },
    );

    player.setSubscriptionDuration(Duration(seconds: 1));
    _subscription = player.onProgress.listen((event) {
      _position.value = event.position;
      if (_duration == null && event.duration.inSeconds > 0) {
        _duration = event.duration;
        _status.value = MusicPlayerStatus.playing;
      }
      if (initial) {
        _status.value = MusicPlayerStatus.playing;
      }
    });
  }

  Future<void> resume({int index}) async {
    if (index != null) {
      play(musics[index].audio);
    }
    final player = await this._completer.future;
    await player.resumePlayer();
    _status.value = MusicPlayerStatus.playing;
  }

  Future<void> pause() async {
    final player = await this._completer.future;
    await player.pausePlayer();
    _status.value = MusicPlayerStatus.paused;
  }

  Future<void> seekTo(Duration position) async {
    final player = await this._completer.future;
    await player.seekToPlayer(position);
  }
}
