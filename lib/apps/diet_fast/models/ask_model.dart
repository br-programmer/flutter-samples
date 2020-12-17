import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' show required;

class AskModel {
  final List<String> questions;

  AskModel({@required this.questions});
}

final asks = <AskModel>[
  AskModel(questions: ['What is your current weight?', 'What is your current weight?']),
  AskModel(questions: ['What is old are you?', 'What is old are you?']),
  AskModel(questions: ['What is your current height?', 'What is your current height?']),
  AskModel(questions: ['What is old are you?', 'What is old are you?']),
];

class AskIndex extends ChangeNotifier {
  int _index = 0;
  int get index => this._index;
  set index(int value) {
    this._index = value;
    notifyListeners();
  }
}
