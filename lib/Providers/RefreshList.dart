import 'package:flutter/material.dart';

class RefreshList extends ChangeNotifier {
  refreshlist(list) {
    notifyListeners();
    return list;
  }
}
