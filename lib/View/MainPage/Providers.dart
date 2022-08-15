import 'package:flutter/material.dart';

class ChangeText extends ChangeNotifier {
  String _text = "Restauracje";

  String get text => _text;

  changeTexted(String label) {
    _text = label;
    notifyListeners();
  }
}
