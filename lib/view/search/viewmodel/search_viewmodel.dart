import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  String _currentText = "";
  int _currentCategoryIndex = 0;

  set currentCategoryIndex(int value) {
    _currentCategoryIndex = value;
    notifyListeners();
  }

  int get currentCategoryIndex => _currentCategoryIndex;

  set currentText(String text) {
    _currentText = text;
    notifyListeners();
  }

  String get currentText => _currentText;

  // List<CategoryModel> getCategories() {}
}
