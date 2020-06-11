import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/models.dart';

class ProfileScreenPresenter with ChangeNotifier {
  final User user;

  final _userFactory = injector.get<UserFactory>();
  bool _isLoading = false;
  bool _isLoggedIn;
  User _fullUser;
  List<Game> _games;
  String _favoriteGameImg;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  User get fullUser => _fullUser;
  List<Game> get games => _games;
  String get favoriteGameImg => _favoriteGameImg;

  ProfileScreenPresenter({@required this.user}) : assert(user != null) {
    _init();
  }

  Future<void> _init() async {
    _getFullUser();
  }

  Future<void> _getFullUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      final currentUser = await injector.get<UserService>().getCurrentUser();
      _isLoggedIn = currentUser.id == user.id;

      _fullUser = await _userFactory.getFullUser(user);

      _games = await _fullUser.getGames();

      _favoriteGameImg = await _fullUser.getFavoriteGameImg();
    } catch (e) {
      print('ProfileScreenPresenter: _getFullUser error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
