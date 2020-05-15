import 'package:flutter/material.dart';

class GamesScreenPresenter with ChangeNotifier {
  ThemeData _theme;

  ThemeData get theme => _theme;

  GamesScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
  }
}
