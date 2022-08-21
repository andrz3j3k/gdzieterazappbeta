import 'package:flutter/material.dart';
import 'package:travelon/Services/AttractionService.dart';
import 'package:travelon/Services/MonumentsService.dart';
import 'ChangeText.dart';

ChangeText changeText = ChangeText();

class ChangeObject extends ChangeNotifier {
  result() {
    switch (changeText.text) {
      case 'Restauracje':
        return fetchAttraction();

      case 'Zabytki':
        return fetchMonuments();
    }
    notifyListeners();
  }
}
