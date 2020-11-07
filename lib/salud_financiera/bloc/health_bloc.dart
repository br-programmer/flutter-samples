import 'package:flutter/material.dart';

class HealthBLoC extends ChangeNotifier {
  PageController _pageController;
  PageController get pageController => this._pageController;

  HealthBLoC() {
    init();
  }
  void init() => _pageController = PageController(viewportFraction: .9);

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
