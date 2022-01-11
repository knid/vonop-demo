import 'package:flutter/material.dart';

class TheMyModel extends ChangeNotifier {
  String _myText1 = "Initial Value";
  String get myText1 => _myText1;
  set myText1(String text) {
    _myText1 = text;
    notifyListeners();
  }

  void updateText() {
    myText1 = "Changed Value";
  }
}
