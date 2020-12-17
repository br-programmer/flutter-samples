import 'package:flutter/material.dart';

class MovieBLoC extends ChangeNotifier {
  ValueNotifier<int> _movieSelected = ValueNotifier(2);

  ValueNotifier<int> get movieSelected => this._movieSelected;

  void setMovieSelected(int selected) {
    this._movieSelected.value = selected;
  }
}
