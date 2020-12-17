import 'package:flutter/painting.dart' show Color;

class MusicAppColors {
  static final Color primary = Color(0xFF000000);
  static final Color secondary = Color(0xFF1F1F1F);
  static final Color bluePurple = Color(0xFF5532DC);
}

String formatTime(Duration time) {
  if (time == null) return '--:--';
  String towDigits(int v) {
    if (v >= 10) return v.toString();
    return '0$v';
  }

  final minutes = time.inMinutes.remainder(60);
  final seconds =
      Duration(seconds: 30).inSeconds - time.inSeconds.remainder(60);
  return '${towDigits(minutes)}:${towDigits(seconds)}';
}


final items = <String>[
  'assets/images/music_app/home.svg',
  'assets/images/music_app/search.svg',
  'assets/images/music_app/layers.svg',
  'assets/images/music_app/cloud.svg',
  'assets/images/music_app/profile.svg',
];

final posters = <String>[
  'assets/images/music_app/dua.png',
  'assets/images/music_app/yatra.png',
  'assets/images/music_app/ozuna.jpg',
  'assets/images/music_app/greeicy.png',
];

final headerMusics = ['New releases', 'Albums', 'Playlists'];
