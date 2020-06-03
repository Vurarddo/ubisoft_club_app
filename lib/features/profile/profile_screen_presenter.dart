import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/user/user_service.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

class ProfileScreenPresenter with ChangeNotifier {
  final User user;

  final _userFactory = injector.get<UserFactory>();
  bool _isLoading = false;
  bool _isLoggedIn;
  User _fullUser;

  bool get isLoading => _isLoading;

  bool get isLoggedIn => _isLoggedIn;

  User get fullUser => _fullUser;

  ProfileScreenPresenter({@required this.user}) : assert(user != null) {
    _init();
  }

  Future<void> _init() async {
    _isLoggedInUser();
    _getFullUser();
  }

  Future<void> _isLoggedInUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      final currentUser = await injector.get<UserService>().getCurrentUser();
      _isLoggedIn = currentUser.id == user.id;
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _getFullUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      _fullUser = await _userFactory.getFullUser(user);
    } catch (e) {
      print('CelebrityScreenPresenter: _init error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
