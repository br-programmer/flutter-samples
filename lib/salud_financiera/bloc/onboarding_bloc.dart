import 'package:flutter/material.dart';

class OnBoardingBLoC extends ChangeNotifier {
  PageController _pageController;
  PageController get pageController => this._pageController;

  OnBoardingBLoC() {
    init();
  }
  void init() => _pageController = PageController();

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
