import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector/injector.dart';
import 'package:ubisoft_club_app/models/models.dart';

class ProfileScreenPresenter with ChangeNotifier {
  final User user;

  final _userFactory = getIt<UserFactory>();
  bool _isLoading = false;
  bool _isLoggedIn;
  User _fullUser;
  List<Game> _games;
  List<UserGameActivity> _userGamesActivity;
  String _favoriteGameImg;
  DateTime _lastTimeInGame;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  User get fullUser => _fullUser;
  List<Game> get games => _games;
  List<UserGameActivity> get userGamesActivity => _userGamesActivity;
  List<String> get platforms => _userFactory.getPlatforms(_games);
  String get favoriteGameImg => _favoriteGameImg;
  DateTime get lastTimeInGame => _lastTimeInGame;

  ProfileScreenPresenter({@required this.user}) : assert(user != null) {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _getUser();
      await _getGames();
    } catch (e) {
      print('ProfileScreenPresenter: _getFullUser error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _getUser() async {
    final currentUser = await getIt<UserService>().getCurrentUser();

    _isLoggedIn = currentUser.id == user.id;
    _fullUser = await _userFactory.getFullUser(user);
    _favoriteGameImg =
        'https://cdn.pixabay.com/photo/2015/05/01/10/32/seagull-748201_960_720.jpg'; // await _fullUser.getFavoriteGameImg();
  }

  Future<void> _getGames() async {
    final userGames = await _fullUser.getGames();

    _games = userGames.keys.map((game) => game).toList();
    _userGamesActivity = userGames.values.map((game) => game).toList();
  }
}
