import 'package:flutter/material.dart';

String _text = "Gastronomia";

class ChangeText extends ChangeNotifier {
  String get text => _text;

  changeTexted(String label) {
    _text = label;
    notifyListeners();
  }
}
