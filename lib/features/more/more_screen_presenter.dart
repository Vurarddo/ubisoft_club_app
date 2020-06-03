import 'package:flutter/material.dart';

class MoreScreenPresenter with ChangeNotifier {
  ThemeData _theme;

  ThemeData get theme => _theme;

  MoreScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
  }
}
