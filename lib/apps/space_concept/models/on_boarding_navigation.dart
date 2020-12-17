import 'package:flutter/material.dart';

class OnBoardingNavigation extends ChangeNotifier {
  PageController _pageController = PageController();
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;
  PageController get pageController => this._pageController;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.ease);
    notifyListeners();
  }
}
