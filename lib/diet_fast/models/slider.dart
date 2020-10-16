import 'package:flutter/material.dart';

class Slider {
  final String path;
  final String title;
  final String detail;

  Slider({@required this.path, @required this.title, @required this.detail});
}

final sliders = <Slider>[
  Slider(
    path: 'assets/images/diet_fast/slider.png',
    title: 'Best tips for your diet',
    detail:
        'In facilisis justo at mi pharetra lobortis. Duis pharetra ornare venenatis. Quisque sit amet sagittis erat.  Nulla maximus porta velit ut molestie. Proin quis convallis mauris.',
  ),
  Slider(
    path: 'assets/images/diet_fast/breack-fast.png',
    title: 'Eat lots of fruits and vegetables',
    detail:
        'Quisque sit amet sagittis erat. Duis pharetra ornare venenatis. Nulla maximus porta velit ut molestie. Proin quis convallis mauris. In facilisis justo at mi pharetra lobortis.',
  ),
  Slider(
    path: 'assets/images/diet_fast/breack-fast2.png',
    title: 'Drink lots of fluids',
    detail:
        'Duis pharetra ornare venenatis. Nulla maximus porta velit ut molestie. Quisque sit amet sagittis erat. Proin quis convallis mauris. In facilisis justo at mi pharetra lobortis.',
  ),
];

class SliderIndex extends ChangeNotifier {
  int _index = 0;
  int get index => this._index;
  set index(int value) {
    this._index = value;
    notifyListeners();
  }
}
