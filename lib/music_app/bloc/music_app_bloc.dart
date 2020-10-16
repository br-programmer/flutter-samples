import 'package:flutter/material.dart';

enum MusicAppState { initial, playing }

class MusicAppBLoC extends ChangeNotifier {
  ValueNotifier<int> _indexSelectedMenu = ValueNotifier<int>(0);
  ValueNotifier<MusicAppState> _state = ValueNotifier<MusicAppState>(MusicAppState.initial);
  ValueNotifier<bool> _playing = ValueNotifier<bool>(false);


  ValueNotifier<int> get indexSelected => this._indexSelectedMenu;
  ValueNotifier<MusicAppState> get state => this._state;
  ValueNotifier<bool> get playing => this._playing;

  set changeIndex(int value) => this._indexSelectedMenu.value = value;
  set isPlay(bool value) => this._playing.value = value;
  set musicAppState(MusicAppState state) {
    this._state.value = state;
    if (state == MusicAppState.playing) {
      this._indexSelectedMenu.value = null;
    } else {
      this._indexSelectedMenu.value = 0;
    }
  }
}
