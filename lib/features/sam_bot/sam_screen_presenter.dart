import 'package:flutter/material.dart';

class SamScreenPresenter with ChangeNotifier {
  ThemeData _theme;

  ThemeData get theme => _theme;

  SamScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
  }
}
