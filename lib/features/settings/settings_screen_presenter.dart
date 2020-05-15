import 'package:flutter/material.dart';

class SettingsScreenPresenter with ChangeNotifier {
  ThemeData _theme;

  ThemeData get theme => _theme;

  SettingsScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
  }
}
