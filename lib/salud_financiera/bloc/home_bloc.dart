import 'package:flutter/material.dart';

enum HomeStatus { movement, statistics }

class HomeBLoC extends ChangeNotifier {
  ValueNotifier<HomeStatus> _status = ValueNotifier(HomeStatus.movement);
  ValueNotifier<int> _indexSelected = ValueNotifier(0);
  ValueNotifier<HomeStatus> get status => this._status;
  ValueNotifier<int> get indextSelected => this._indexSelected;

  set indexSelected(int index) {
    this._indexSelected.value = index;
    if (index == 0) {
      this._status.value = HomeStatus.movement;
    } else if (index == 2) {
      this._status.value = HomeStatus.statistics;
    }
  }
}
