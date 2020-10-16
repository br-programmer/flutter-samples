import 'package:flutter/cupertino.dart';

enum SplashStatus { loading, loaded }

class SplashBLoC extends ChangeNotifier {
  ValueNotifier<SplashStatus> _status = ValueNotifier<SplashStatus>(SplashStatus.loading);
  ValueNotifier<SplashStatus> get status => this._status;

  SplashBLoC() {
    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 4));
    _status.value = SplashStatus.loaded;
  }
}
