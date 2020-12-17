import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/models/phone.dart';

class PageViewBLoC extends ChangeNotifier {
  PageController _pageController = PageController();

  PageController get controller => this._pageController;

  PageViewBLoC() {
    this._init();
  }

  void _init() async {
    int nextPage = (this._pageController.hasClients) ? this._pageController.page.toInt() + 1 : 1;
    if (nextPage == hotSales.length) {
      nextPage = 0;
    }
    await Future.delayed(const Duration(seconds: 5));
    await this._pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    this._init();
  }
}
