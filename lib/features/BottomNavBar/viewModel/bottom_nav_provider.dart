import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int _pages = 0;

  get pages => _pages;

  setPage(int page) {
    _pages = page;
    notifyListeners();
  }
}
