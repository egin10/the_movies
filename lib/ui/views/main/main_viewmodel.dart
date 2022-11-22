import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _menus = [
    {'title': 'Movies'},
    {'title': 'TV Shows'},
    {'title': 'People'},
  ];
  int _menuIndex = 0;

  List<Map<String, dynamic>> get menus => _menus;
  int get menuIndex => _menuIndex;

  setMenuIndex(int value) {
    _menuIndex = value;
    notifyListeners();
  }
}
