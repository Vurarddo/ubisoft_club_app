import 'package:flutter/material.dart';

import 'package:ubisoft_club_app/infrastructure/injector/injector.dart';
import 'package:ubisoft_club_app/models/models.dart';

class GamesScreenPresenter with ChangeNotifier {
  final _userFactory = getIt<UserFactory>();
  bool _isLoading = false;
  List<Game> _games;

  bool get isLoading => _isLoading;
  List<Game> get games => _games;

  GamesScreenPresenter() {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    try {
      final currentUser = await getIt<UserService>().getCurrentUser();
      final user = await _userFactory.getFullUser(currentUser);
      final userGames = await user.getGames();
      _games = userGames.keys.map((game) => game).toList();
    } catch (e) {
      print('GeneralScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
