import 'package:flutter/material.dart';

class PageViewBLoC extends ChangeNotifier {
  PageController controller;

  PageViewBLoC() {
    _init();
  }

  void _init() {
    controller = PageController(initialPage: 1, viewportFraction: .65);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
