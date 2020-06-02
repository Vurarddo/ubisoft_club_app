import 'package:flutter/foundation.dart';

import 'package:ubisoft_club_app/infrastructure/injector.dart';
import 'package:ubisoft_club_app/models/user/user.dart';

class ProfileScreenPresenter with ChangeNotifier {
  final User user;

  final _userFactory = injector.get<UserFactory>();
  bool _isLoading = false;
  User _fullUser;

  bool get isLoading => _isLoading;

  User get fullUser => _fullUser;

  ProfileScreenPresenter({@required this.user}) : assert(user != null) {
    _init();
  }

  Future<void> _init() async {
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
