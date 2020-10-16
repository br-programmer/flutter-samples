import 'package:flutter/material.dart';

class PageViewBLoC extends ChangeNotifier {
  ValueNotifier<int> _page = ValueNotifier<int>(1);
  PageController _pageController = PageController(viewportFraction: .6, initialPage: 1);
  PageController get pageController => this._pageController;
  ValueNotifier<int> get page => this._page;

  set setPage(int value) {
    this._page.value = value;
    this._pageController.animateToPage(value, duration: const Duration(milliseconds: 350), curve: Curves.ease);
  }
}
